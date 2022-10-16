class Public::HomesController < ApplicationController
  def new
  end

  def top
    @genres = Genre.all
    @items = Item.order('id DESC').limit(4)
  end

  def about
  end

end
