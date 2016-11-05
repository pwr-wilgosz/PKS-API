require "application_responder"

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include CanCan::ControllerAdditions

  respond_to :json
  self.responder = ApplicationResponder

  rescue_from CanCan::AccessDenied, with: :access_denied

  before_action :set_json_format

  private

  def access_denied
    render json: {
      status: 'error',
      errors: {
        authentication: ['You are not auhtorized to access this resource'] }
    }, status: 403
  end

  def set_json_format
    self.request.format = :json
  end
end

