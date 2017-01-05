class StopsController < ApplicationController
  before_action :authenticate_user!, only: [ :create, :update, :destroy ]

  load_and_authorize_resource :stop

  def index
    respond_with Stop.all
  end

  def show
    respond_with Stop.find(params[:id])
  end

  def create
    respond_with Stop.create() #stop_params
  end

  def update
    @stop.update_attributes() #stop_params
    respond_with @stop
  end

  def destroy
    respond_with @stop.destroy
  end

  private

  #def stop_params
  #  params.permit(:a, :b, :c)
  #end
end