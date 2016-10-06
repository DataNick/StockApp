class CreateMovements < ActiveRecord::Migration
  def change
    create_table :movements do |t|
      t.integer :quantity
      t.decimal :price
      t.datetime :date
      t.references :transaction
      t.string :action

      t.timestamps null: false
    end
  end
end
