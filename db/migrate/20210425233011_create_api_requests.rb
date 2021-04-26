# frozen_string_literal: true

class CreateApiRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :api_requests do |t|
      t.string :action_type
      t.string :description
      t.references :user

      t.timestamps
    end
  end
end
