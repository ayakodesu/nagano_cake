class Public::ItemsController < ApplicationController



  def index
    @items = Item.all
    @genres = Genre.all
    @items = Item.order('id DESC').limit(8)

  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end


end
