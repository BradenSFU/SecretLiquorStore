class ChangeToPublishId < ActiveRecord::Migration[5.0]
  def change
    rename_column :likes, :drink_id, :publish_id
  end
end
