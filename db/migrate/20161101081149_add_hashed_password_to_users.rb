class AddHashedPasswordToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :hashedpassword, :string
  end
end
