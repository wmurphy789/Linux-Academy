class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
    	t.string :license_number
    	t.integer :car_type
    	t.timestamps null: false
    end
  end
end
