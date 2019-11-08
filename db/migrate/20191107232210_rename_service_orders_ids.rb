class RenameServiceOrdersIds < ActiveRecord::Migration[5.2]
  def change
  	remove_reference :materials, :service_materials
  	remove_reference :orders, :service_orders
  	remove_reference :patients, :orders
  end
end
