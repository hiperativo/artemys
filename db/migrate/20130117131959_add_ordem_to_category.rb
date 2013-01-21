class AddOrdemToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :ordem, :integer
  end
end
