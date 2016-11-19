class AddMoreToPublishes < ActiveRecord::Migration[5.0]
  def change
    add_column :publishes, :image, :string
    add_column :publishes, :ingredients, :text
    add_column :publishes, :instructions, :text
  end
end
