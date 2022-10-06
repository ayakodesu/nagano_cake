class Admin::ItemsController < ApplicationController

  def index
    @items = Item.new
    @items = Item.page(params[:page])
  end

  def new
    @items = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path(@item.id)
  end



  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_itemss_path(@item.id)

  end

  def show
  end

end
