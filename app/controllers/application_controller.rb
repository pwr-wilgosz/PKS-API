require "application_responder"

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  respond_to :json
  self.responder = ApplicationResponder

  before_action :set_json_format

  private

  def set_json_format
    self.request.format = :json
  end
end

