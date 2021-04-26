# frozen_string_literal: true

class ApplicationController < ActionController::API
  after_action :log_request

  private

  def log_request
    action_type = response.status == 200 ? 'Success' : 'Error'
    ApiRequest.create({ response_type: action_type, request_details: response.request.inspect })
  end
end
