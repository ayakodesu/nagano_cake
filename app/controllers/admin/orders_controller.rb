class Admin::OrdersController < ApplicationController
  def show

    @order = Order.find(params[:id])
    @order_details = OrderDetail.page(params[:page])


  end
end
