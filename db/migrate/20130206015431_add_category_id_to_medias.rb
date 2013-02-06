class AddCategoryIdToMedias < ActiveRecord::Migration
  def change
    add_column :media, :category_id, :integer
  end
end
