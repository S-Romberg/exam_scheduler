# frozen_string_literal: true

class CreateExams < ActiveRecord::Migration[6.1]
  def change
    create_table :exams do |t|
      t.string :name
      t.references :college

      t.timestamps
    end
  end
end
