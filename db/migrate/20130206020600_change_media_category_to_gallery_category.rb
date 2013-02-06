class ChangeMediaCategoryToGalleryCategory < ActiveRecord::Migration
  def up
  	rename_table :media_categories, :gallery_categories
  end

  def down
  end
end
