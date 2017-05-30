class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
    	t.integer :car_id
    	t.boolean :mud_in_bed
    	t.timestamps null: false
    end

    add_index :transactions, :car_id
  end
end
