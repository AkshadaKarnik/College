class RemoveColumnInUsers < ActiveRecord::Migration[7.0]
  def change
    remove_reference :users, :department
  end
end
