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

  private

  def course_params
    params.permit()
  end
end