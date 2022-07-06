class AdressesController < ApplicationController
  def index
    @adresses = Adress.all
  end

  def new
    @adress = Adress.new
  end

  def create
    @adress = Adress.new(adress_params)
    @adress.save
    redirect_to adresses_path
  end

  def edit
    @adress = Adress.find(params[:id])
  end

  def show
  end

  def update
    @adress = Adress.find(params[:id])
    @adress.update(adress_params)
    redirect_to root_path
  end
end

private
def adress_params
  params.permit(:postal_code, :address, :name)
end
