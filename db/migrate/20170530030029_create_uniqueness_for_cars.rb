class CreateUniquenessForCars < ActiveRecord::Migration
  def change
    change_column :cars, :license_number, :string, :unique => true
  end
end
