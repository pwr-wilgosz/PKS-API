class IssuesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_issue , only: [:update, :destroy]
  load_and_authorize_resource :bus
  load_and_authorize_resource :issue, through: :bus

  def index
    respond_with Issue.where(bus_id: params[:bus_id])
  end

  def create
    issue = Issue.create(issue_params)

    render json: {
      status: 'OK',
      result: {
        issue: issue.to_json
      }
    }, status: 200
  end

  def destroy
    issue = Issue.destroy(@issue)

    render json: {
      status: 'OK',
      result: {
        issue: issue.to_json
      }
    }, status: 200
  end

  def update
    @issue.update_attributes(issue_params)
    respond_with @issue
  end

  def get_issue
    params.require(:id)
    params.require(:bus_id)
  	@issue = Issue.where(id: params[:id], bus_id: params[:bus_id]).take(1)
  end

  def issue_params
    params.require(:bus_id)
    params.permit(:bus_id, :name, :description, :solved)
  end
end