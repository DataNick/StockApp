class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :type
      t.integer :num_of_shares
      t.float :price
      t.references :portfolio, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
