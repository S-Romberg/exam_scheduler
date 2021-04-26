# frozen_string_literal: true

class ExamUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :exam_users do |t|
      t.references :user, foreign_key: true
      t.references :exam, foreign_key: true
      t.datetime :start_time

      t.timestamps
    end
  end
end
