class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :image
      t.string :video

      t.timestamps
    end
  end
end
