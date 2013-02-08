class CollectionsPieces < ActiveRecord::Migration
  def change
  	create_table :collections_pieces, id: false do |t|
  		t.integer :collection_id
  		t.integer :piece_id
  	end
  end
end
