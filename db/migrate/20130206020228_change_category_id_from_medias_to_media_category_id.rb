class ChangeCategoryIdFromMediasToMediaCategoryId < ActiveRecord::Migration
  def up
  	rename_column :media, :category_id, :media_category_id
  end

  def down
  end
end
