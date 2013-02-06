class ChangeMediaToGalleryItem < ActiveRecord::Migration
  def up
  	rename_table :media, :gallery_items
  end

  def down
  end
end
