class ItemsController < ApplicationController
  def index
    @items = Product.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
  end
end

private

def product_params
  params.require(:item).permit(:name, :price, images_attributes: [:src])
end