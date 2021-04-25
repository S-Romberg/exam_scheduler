class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.references :colleges
      t.string :first_name
      t.string :last_name
      t.string :phone_number

      t.timestamps
    end
  end
end