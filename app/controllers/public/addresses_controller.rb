class Public::AddressesController < ApplicationController
  def index
    @customer = Customer.new
    @customers = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end
end
