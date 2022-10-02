class Admin::GenresController < ApplicationController
  def new
    @admin = Admin.new
  end

  def index
    @admins = Admin.all
  end

  def edit
  end
end
