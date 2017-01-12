class CoursesController < ApplicationController
  before_action :authenticate_user!, only: [ :create, :update, :destroy ]

  load_and_authorize_resource :course

  def index
    respond_with Course.all
  end

  def show
    respond_with Course.find(params[:id])
  end

  def create
    respond_with Course.create(course_params)
  end

  def update
    @course.update_attributes(course_params)
    respond_with @course
  end

  def destroy
    respond_with @course.destroy
  end

  def remove_bus
    respond_with @course.buses.delete(params[:bus_id])
  end

  def remove_stop
    respond_with @course.stops.delete(params[:stop_id])
  end

  def add_bus
    @course.buses << Bus.find(params[:bus_id])
    respond_with @course.buses.find(params[:bus_id])
  end

  def add_stop
    @course.stops << Stop.find(params[:stop_id])
    respond_with @course.stops.find(params[:stop_id])
  end

  private

  def course_params
    params.permit(:name)
  end
end