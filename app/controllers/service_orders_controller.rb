class ServiceOrdersController < ApplicationController

  def new
    @service_order = ServiceOrder.new
  end

  def show
    @order = Order.find(params[:order_id])
    @service_order = @order.service_orders.find(params[:id])
  end

  def edit
    @order = Order.find(params[:order_id])
    @service_order = @order.service_orders.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:order_id])
    @service_order = @order.service_orders.find(params[:id])
    @service_order.destroy
    redirect_to @order
  end

  def update
    @order = Order.find(params[:order_id])
    @service_order = @order.service_orders.find(params[:id])
    @service_order.update_attributes(service_order_params)
    if @service_order.save
      redirect_to @order
    else
      render 'edit'
    end
  end

  def create
    @order = Order.find(params[:order_id])
    @service_order = ServiceOrder.create(service_order_params)
  end

  private

  def service_order_params
    params.require(:service_order).permit(:value, :order_id, :service_id)
  end

end
