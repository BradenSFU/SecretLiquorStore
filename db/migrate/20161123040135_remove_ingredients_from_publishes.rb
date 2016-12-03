class RemoveIngredientsFromPublishes < ActiveRecord::Migration[5.0]
  def change
    remove_column :publishes, :ingredients, :string
  end
end
