class Public::OrdersController < ApplicationController
  def show
    
  end

  def new
    @order  = Order.new
    @customer = current_customer
  end

  def confirm
  end

  def complete
  end

  def create
  end

  def index
  end
end
