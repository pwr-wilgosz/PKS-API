class IssuesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :bus
  load_and_authorize_resource :issue, through: :bus

  def index
    respond_with @bus.issues.all
  end
end

