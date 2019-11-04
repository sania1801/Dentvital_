class ChangesOfMaterialsTable < ActiveRecord::Migration[5.2]
  def change
  	remove_column :materials, :id_material
  	remove_column :materials, :value
  	add_reference :materials, :service_materials
  end
end
