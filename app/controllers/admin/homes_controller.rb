class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all.page(params[:page])

    @items = Item.order('id DESC').limit(4)
  end
end

