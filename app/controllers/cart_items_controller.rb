class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @items = Item.all
  end

  def new
    @cart_item = CartItem.new
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  end

#def subtotal
 #   item.with_tax_price * amount
#end

end

private
def cart_item_params
  params.require(:cart_item).permit(:item_id, :amount)
end
