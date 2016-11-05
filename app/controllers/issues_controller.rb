class IssuesController < ApplicationController
  def index
    respond_with Issue.all

  end
end

