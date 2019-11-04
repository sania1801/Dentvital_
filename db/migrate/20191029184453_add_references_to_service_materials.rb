class AddReferencesToServiceMaterials < ActiveRecord::Migration[5.2]
  def change
  	add_reference :service_materials, :material
  	add_reference :service_materials, :service
  end
end
