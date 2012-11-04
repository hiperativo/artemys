class AddCollectionIdToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :collection_id, :integer
  end
end
