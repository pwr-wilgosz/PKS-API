class BusesController < ApplicationController
  before_action :authenticate_user!, only: [ :create, :update, :destroy ]

  load_and_authorize_resource :bus

  def index
    respond_with Bus.all
  end

  def create
    respond_with Bus.create(bus_params)
  end

  def update
    @bus.update_attributes(bus_params)
    respond_with @bus
  end

  def destroy
    respond_with @bus.destroy
  end

  private

  def bus_params
    params.permit(:brand, :spaces, :registration_number)
  end
end

