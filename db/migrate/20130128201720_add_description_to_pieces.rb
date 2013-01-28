class AddDescriptionToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :description, :text
  end
end
