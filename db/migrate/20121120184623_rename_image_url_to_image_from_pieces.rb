class RenameImageUrlToImageFromPieces < ActiveRecord::Migration
  def up
  	change_table :pieces do |t|
  		t.rename :image_url, :image
  	end
  end

  def down
  	change_table :pieces do |t|
  		t.rename :image, :image_url
  	end
  end
end
