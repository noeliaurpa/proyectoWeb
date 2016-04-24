class AddAndChance < ActiveRecord::Migration
    def change
        remove_foreign_key :transactions, column: :products_id
        rename_column :transactions, :products_id, :product_req_id
        add_column :transactions, :product_offered_id, :string
    end
end
