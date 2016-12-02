class ChangePublishName < ActiveRecord::Migration[5.0]
  def change
    rename_column :publishes, :Rname, :name
  end
end
