class AddWatermarkToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :watermark, :boolean
  end
end
