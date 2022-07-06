class Admin::ShopsController < ApplicationController
  
  def index
    @shops = Shop.all
    @shop = Shop.new
  end
  #def newをなくして、indexの中にShop.newを入れた。一応動いてる。

  def create
    @shop = Shop.new(shop_params)
    @shop.save
    redirect_to '/admin/shops' #indexへ
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params)
    redirect_to admin_shop_path(@shop.id)#showページへ
  end

end



private
def shop_params
  params.require(:shop).permit(:title, :body)
end
