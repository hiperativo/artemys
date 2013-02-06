class CreateMediaCategorizations < ActiveRecord::Migration
  def change
    create_table :media_categorizations do |t|
      t.integer :media_id
      t.integer :media_category_id

      t.timestamps
    end
  end
end
