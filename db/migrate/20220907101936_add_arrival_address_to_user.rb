class AddArrivalAddressToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :arrival_address, :string
  end
end
