class SetDefaultForTransactions < ActiveRecord::Migration
  def change
  	change_column :transactions, :mud_in_bed, :boolean, :default => false
  end
end
