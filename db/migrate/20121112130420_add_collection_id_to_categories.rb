class AddCollectionIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :collection_id, :integer
  end
end
