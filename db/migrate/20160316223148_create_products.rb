class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.boolean :state
      t.references :users, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
