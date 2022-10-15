class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
    @orderDetails = OrderDetail.all
  end
end
