class Public::OrdersController < ApplicationController
  def show
    @order  = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def new
    @order  = Order.new
    @customer = current_customer
  end

  def confirm
    @order  = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.name = current_customer.last_name + current_customer.first_name
    @order.address = current_customer.address
    @cart_items = current_customer.cart_items
  end

  def complete
  end

  def create
    @order  = Order.new(order_params)
    @order.customer_id = current_customer.id
    @customer = current_customer
    @order.postage = 800
    if @order.save
      @cart_items = current_customer.cart_items
      @cart_items.each do|cart_item|
      order_detail = OrderDetail.new
      order_detail.item_id = cart_item.item_id
      order_detail.amount = cart_item.amount
      order_detail.order_id = @order.id
      order_detail.purchase_price = Item.find(cart_item.item_id).with_tax_price
      order_detail.save
      end
      @cart_items.destroy_all
      redirect_to complete_path
    end

  end

  def index
    @orders  =  current_customer.orders
    @order_details = current_customer
  end

  private
  def order_params
    params.require(:order).permit(:customer_id,:postal_code,:address,:billing_amount,:payment_method,:name,:postage)
  end
end
