class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :products, index: true, foreign_key: true
      t.references :products, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
