class Admin::OrdersController < ApplicationController
  def show
  end
  def index
    @orders = Orders.all
  end
end
