class CreateMediaCategories < ActiveRecord::Migration
  def change
    create_table :media_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
