class RemovePasswordFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :Password, :string
  end
end
