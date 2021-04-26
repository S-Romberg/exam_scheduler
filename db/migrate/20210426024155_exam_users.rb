class ExamUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :exam_users do |t|
      t.references :users, foreign_key: true
      t.references :exams, foreign_key: true
      t.datetime :start_time

      t.timestamps
    end
  end
end
