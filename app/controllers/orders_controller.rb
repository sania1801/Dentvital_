class OrdersController < ApplicationController


  def new
    @patient = Patient.find(params[:format])
    @order = @patient.orders.new
    @services = Service.all  
    @services.each do |service|
      @order.service_orders.build(service_id: service.id)
    end
  end

  def show
    @patient = find_patient
    @order = @patient.orders.find(params[:format])
  end

  def destroy
    @patient = Patient.find(params[:id])
    @order = Order.find(params[:format])
    writing_off(1)
    @order.destroy
    redirect_to patient_path(@patient)
  end

  def edit
    @patient = Patient.find(params[:id])
    @order = Order.find(params[:format])
  end

  def update
    @order = Order.find(params[:id])
    @patient = @order.patient
    @order.update_attributes(order_params)
    if @order.save
      redirect_to patient_path(@patient)
    else
      render 'edit'
    end
  end

  def create
    @order =  Order.create(order_params)
    @patient = @order.patient
    @order.date_order = DateTime.now
    @order.age = age(@patient.dob)
    @order.service_orders.each do |t|
      @order.total += (t.service.cost.to_f * t.value)
    end
    if @order.save
      # Order.new.write_off(@order, -1)
      writing_off(-1)
      flash[:notice] = "Successfully created page."
      redirect_to patient_path(@patient)
    else
      render :action => 'new'
    end
  end

  def writing_off(sign)
     @order.service_orders.each do |service_order|
        ServiceMaterial.all.each do |service_material|
          if service_material.service.id == service_order.service.id
            @material = Material.where({service_material: service_material}).first
            @material.value += sign * service_material.value_m * service_order.value
            binding.pry
            @material.save
          end
        end
      end
  end

  def age(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def find_patient
      @patient = Patient.find(params[:id])
    end

    def find_order
      @order = @patient.orders.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:diagnose, :patient_id, {service_orders_attributes: [:service_id, :value]})
    end

  public




end
