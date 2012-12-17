class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :country
      t.string :state
      t.string :city
      t.string :store
      t.string :localization

      t.timestamps
    end
  end
end
