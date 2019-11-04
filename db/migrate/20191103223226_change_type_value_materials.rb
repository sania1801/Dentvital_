class ChangeTypeValueMaterials < ActiveRecord::Migration[5.2]
  def change
  	remove_column :service_materials, :value_m
  	add_column :service_materials, :value_m, :float
  end
end
