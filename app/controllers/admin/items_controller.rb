class Admin::ItemsController < ApplicationController

  def index
    @items = Item.new
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update

  end




end
