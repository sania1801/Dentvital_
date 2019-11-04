class CreateServiceMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :service_materials do |t|
      t.string :value_m
      t.timestamps
    end
  end
end
