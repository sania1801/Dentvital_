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
      writing_off(-1)
      flash[:notice] = "Successfully created page."
      redirect_to patient_path(@patient)
    else
      render :action => 'new'
    end
  end

  def writing_off(sign)
     @order.service_orders.each do |service_order|
      service_material = ServiceMaterial.where(["service_id = ?",service_order.service.id]).first
      if service_material.nil?
        material = Material.where({service_material: service_material.id}).first
        material.value += sign * service_material.value_m * service_order.value
        material.save
      end
    end
  end

  def age(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end


  private

    def find_patient
      @patient = Patient.find(params[:id])
    end

    def find_order
      @order = @patient.orders.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:diagnose, :patient_id, {service_orders_attributes: [:service_id, :value]})
    end

  public




end
