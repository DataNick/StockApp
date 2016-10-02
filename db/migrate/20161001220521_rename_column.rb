class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :transactions, :type, :buy_sell
  end
end
