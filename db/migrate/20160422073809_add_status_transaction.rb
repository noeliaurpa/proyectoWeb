class AddStatusTransaction < ActiveRecord::Migration
  def change
  	add_column :transactions, :state, :boolean
  end
end
