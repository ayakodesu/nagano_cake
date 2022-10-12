class Public::HomesController < ApplicationController
  def new
  end

  def top
    @genres = Genre.all
  end

  def about
  end

end
