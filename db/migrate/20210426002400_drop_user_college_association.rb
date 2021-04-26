class DropUserCollegeAssociation < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :college_id
  end
end
