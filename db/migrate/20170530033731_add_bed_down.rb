class AddBedDown < ActiveRecord::Migration
  def change
  	add_column :transactions, :bed_down, :boolean, :default => false
  end
end
