class RemoveItemsIdFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :items_id, :integer
  end
end
