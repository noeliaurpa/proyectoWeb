class AddUserTransaction < ActiveRecord::Migration
  def change
  	add_column :transactions, :id_user, :integer
  end
end
