class AddValueToMaterials < ActiveRecord::Migration[5.2]
  def change
  	add_column :materials, :value, :float, default: 0.0
  end
end
