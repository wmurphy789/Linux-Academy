class AddTotalToTransactions < ActiveRecord::Migration
  def change
  	add_column :transactions, :total, :float
  end
end
