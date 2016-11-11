class IssuesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_issue , only: [:update]
  load_and_authorize_resource :bus
  load_and_authorize_resource :issue, through: :bus

  def index
    respond_with Issue.where(bus_id: params[:bus_id])
  end

  def update
    @issue.update_attributes(issue_params)
    respond_with @issue
  end

  def get_issue
  	@issue = Issue.where(id: params[:id], bus_id: params[:bus_id]).take(1)
  end

  def issue_params
    params.permit(:name, :description, :solved)
  end
end