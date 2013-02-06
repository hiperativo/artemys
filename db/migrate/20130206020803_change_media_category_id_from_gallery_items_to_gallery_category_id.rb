class ChangeMediaCategoryIdFromGalleryItemsToGalleryCategoryId < ActiveRecord::Migration
  def up
  	rename_column :gallery_items, :media_category_id, :gallery_category_id
  end

  def down
  end
end
