class Admin::ItemsController < ApplicationController
def new
  @item = Item.new
end
def index
  @items = Item.all.page(params[:page])
end
def create
  @item = Item.new(item_params)
  @item.save
  redirect_to admin_root_path
end
def show
    @item = Item.find(params[:id])
end
def edit
end
def update
end
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end
end


