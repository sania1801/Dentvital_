class ServiceMaterialController < ApplicationController

	def index
		@service_materials= ServiceMaterial.all
	end

	def new
		@service_material = ServiceMaterial.new
		@services = Service.all
		@services.each do |service|
			@service_material.services.build(service_id: service.id)
		end
	end

	def show

	end

	def edit
		@serivice_material.find(params[:id])
		@service_material.update_attributes
	end

	def create


	end

	private

	def service_material_params
	params.require(:service_materials).permit(:value_m,:material_id,
											{services_attributes:[:code,:name,:cost]})
	end
end
