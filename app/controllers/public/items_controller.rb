class Public::ItemsController < ApplicationController
  def index
   @items = Item.all.page(params[:page])
  end
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem .new
  end

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end
end