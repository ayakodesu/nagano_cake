class Public::CartItemsController < ApplicationController



  def index
    @cart_items = CartItem.all
    @items = Item.all
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_item.save
    redirect_to
  end




private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
