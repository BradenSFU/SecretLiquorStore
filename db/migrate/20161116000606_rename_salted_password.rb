class RenameSaltedPassword < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :saltedpassword, :passwordsalt
  end
end
