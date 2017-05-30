class AddDeletedAtToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :deleted_at, :datetime
    add_index :transactions, :deleted_at

    add_column :cars, :deleted_at, :datetime
    add_index :cars, :deleted_at
  end
end
