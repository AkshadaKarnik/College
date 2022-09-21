class AddColumnCollageInDepartments < ActiveRecord::Migration[7.0]
  def change
    remove_column :departments, :college_id, null: false, foreign_key: true
    add_column :departments, :college_id, :integer 
  end
end
