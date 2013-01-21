class AddOrdemToPiece < ActiveRecord::Migration
  def change
    add_column :pieces, :ordem, :integer
  end
end
