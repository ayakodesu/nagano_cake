class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
    @orderDetails = OrderDetail.all
    @items = Item.order('id DESC').limit(4)
  end
end
