class AddIngredientsListToPublish < ActiveRecord::Migration[5.0]
  def change
    add_column :publishes, :ingredientsList, :string, array: true, default: []
  end
end
