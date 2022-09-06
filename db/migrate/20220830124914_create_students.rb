class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.references :college, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
      t.string :name
      t.string :enroll_no
      t.date :clg_start_date
      t.date :clg_end_date
      t.string :gender
      t.integer :age 
      t.string :contact
      t.string :email
      t.string :password
      t.string :permanent_address
      t.string :current_address
      t.string :aadhar_no
      
      t.timestamps
    end
  end
end
