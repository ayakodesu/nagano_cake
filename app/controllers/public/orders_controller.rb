class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses
    @customer = current_customer

  end

  def create
    @order = Order.new(order_params)
    @order.save
      current_customer.cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.order_id = @order.id
      order_detail.item_id = cart_item.item.id
      order_detail.price = @order.total_payment
      order_detail.amount = cart_item.amount
      order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to public_orders_complete_path

  end


  def complete
  end

  def index
		@orders = current_customer.orders.page(params[:page])
  end

  def show
    @orders = current_customer.orders
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.shipping_cost = 800
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    @select_address = params[:order][:select_address]
    if @select_address == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif @select_address == "1"
      @address_id = params[:order][:address_id]
      @address = Address.find(@address_id)
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    else

    end

  end

   private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
end
