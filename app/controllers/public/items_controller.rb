class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genres = Genre.all
    @items = Item.order('id DESC').limit(8)
  end

  def show
  end


end
