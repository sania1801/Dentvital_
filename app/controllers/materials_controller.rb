class MaterialsController < ApplicationController

  def index
    @materials = Material.all
  end

  def new
    @material = Material.new
  end

  def edit
    @material= Material.find(params[:id])
  end

  def update
    @material= Material.find(params[:id])
    @material.update_attributes(material_params)
      respond_to do |format|
        if @material.save
          format.html {redirect_to materials_path, notice: "Material was successfully update."}
          format.json { render :show, status: :created, location: @material }
        else
          format.html { render :new }
          format.json { render json: @material.errors, status: :unprocessable_entity }
        end
      end
    end

  def show
    @material = Material.find(params[:id])
  end

  def create
    @material = Material.create(material_params)
    respond_to do |format|
      if @material.save
        format.html {redirect_to materials_path, notice: "Material was successfully created."}
        format.json { render :show, status: :created, location: @material }
      else
        format.html { redirect_to materials_path }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def material_params
    params.require(:material).permit(:name,:value, :id_material)
  end

end

