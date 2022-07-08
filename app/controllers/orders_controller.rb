class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @items = Item.all
    @cart_items = CartItem.all
    @order = Order.new(order_params)
    @address = Adress.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_complete_path
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end
end

private
def order_params
  params.require(:order).permit(:payment_method,:postal_code, :address, :name)
end

def item_params
  params.require(:item).permit(:name, :introduction, :image, :price)
end

def cart_item_params
  params.require(:cart_item).permit(:item_id, :amount)
end
