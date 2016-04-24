class ChangeTypeProductsReqId < ActiveRecord::Migration
  def change
      change_column :transactions, :product_offered_id, :integer
  end
end
