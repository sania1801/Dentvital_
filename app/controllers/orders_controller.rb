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
    @order.writing_off(1,@order)
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
    @order.math_data(@order)
    if @order.save
      @order.writing_off(-1,@order)
      flash[:notice] = "Successfully created page."
      redirect_to patient_path(@patient)
    else
      render 'new'
    end
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
