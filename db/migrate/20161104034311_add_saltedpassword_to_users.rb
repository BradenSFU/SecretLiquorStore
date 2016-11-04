class AddSaltedpasswordToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :saltedpassword, :string
  end
end
