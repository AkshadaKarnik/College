class CreateColleges < ActiveRecord::Migration[7.0]
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :contact
      t.timestamps
    end
  end
end