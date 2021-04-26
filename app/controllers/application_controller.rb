class ApplicationController < ActionController::API
  after_action :log_request

  private
   def log_request
     action_type = response.status == 200 ? 'Request' : 'Error'
     ApiRequest.create({action_type: action_type, description: request})
   end
end
