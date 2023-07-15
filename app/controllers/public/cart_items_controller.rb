class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def update
    @cart_items = CartItem.find(params[:id])
    @cart_items.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_items = CartItem.find(params[:id])
    @cart_items.destroy
    redirect_to cart_items_path
  end
  def all_destroy
    CartItem.destroy_all
    redirect_to cart_items_path
  end


 def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_item.customer_id=current_customer.id
    @cart_items=current_customer.cart_items.all
    @cart_items.each do |cart_item|
    if cart_item.item_id==@cart_item.item_id
    new_amount = cart_item.amount + @cart_item.amount
    cart_item.update_attribute(:amount, new_amount)
    @cart_item.delete
    end
    end
    @cart_item.save
    redirect_to cart_items_path
 end
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount )
  end
end
