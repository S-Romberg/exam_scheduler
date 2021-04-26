class UpdateApiRequestColumnNames < ActiveRecord::Migration[6.1]
  def change
    rename_column :api_requests, :action_type, :response_type
    rename_column :api_requests, :description, :request_details
  end
end
