class AddOrdemToGalleryItemsAndCategories < ActiveRecord::Migration
  def change
  	add_column :gallery_items, :ordem, :integer
  	add_column :gallery_categories, :ordem, :integer
  end
end
