class AddAdminToCustomer < ActiveRecord::Migration
  def change
    add_column :customer, :admin, :boolean, default: false
  end
end
