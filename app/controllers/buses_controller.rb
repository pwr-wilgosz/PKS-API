class BusesController < ApplicationController
  before_action :authenticate_user!, only: [ :create, :update, :destroy ]

  load_and_authorize_resource :bus

  def index
    respond_with Bus.all
  end

  def create
    respond_with Bus.create(bus_params)
  end

  private

  def bus_params
    params.permit(:brand, :spaces, :registration_number)
  end
end

