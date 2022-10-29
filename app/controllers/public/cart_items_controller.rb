class Public::CartItemsController < ApplicationController



  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_item.save
    redirect_to public_cart_items_path
      end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end


  def destroy_all
    CartItem.destroy_all
    current_customer.cart_items.destroy_all
    redirect_to public_cart_items_path
  end




private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
  end
end