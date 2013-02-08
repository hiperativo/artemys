class AddDescriptionEsToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :description_es, :string
  end
end
