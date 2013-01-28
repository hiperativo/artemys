class RenameDescriptionToDescriptionEs < ActiveRecord::Migration
  def up
  	change_table :pieces do |t|
  		t.rename :description, :description_en
  	end
  end

  def down
  end
end
