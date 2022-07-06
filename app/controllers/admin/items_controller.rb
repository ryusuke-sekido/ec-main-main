class Admin::ItemsController < ApplicationController

#def with_tax_price
    #(price * 1.1).floor
#end
  def index
    @items = Item.all
  end

  def new
     @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path(@item.id)#showページへ
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
end

private
def item_params
  params.require(:item).permit(:name, :body, :image, :price)
end