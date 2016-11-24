class IssuesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :bus
  load_and_authorize_resource :issue, through: :bus

  def index
    respond_with @bus.issues
  end

  def create
    respond_with @bus.issues.create(issue_params)
  end

  def destroy
    respond_with @issue.destroy
  end

  def update
    respond_with @issue.update_attributes(issue_params)
  end

  def issue_params
    params.permit(:name, :description, :solved)
  end
end

