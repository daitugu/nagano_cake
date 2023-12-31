class Admin::ItemsController < ApplicationController
  layout 'top'
def new
  @item = Item.new
end
def index
  @items = Item.all.page(params[:page])
end
def create
  @item = Item.new(item_params)
  @item.save!
  redirect_to  admin_item_path(@item.id)
end
def show
    @item = Item.find(params[:id])
end
def edit
    @item = Item.find(params[:id])
end
def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
end
  def destroy
    @item = Item.find(params[:id])  # データ（レコード）を1件取得
    @item.destroy  # データ（レコード）を削除
    redirect_to admin_root_path
  end
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end
end


