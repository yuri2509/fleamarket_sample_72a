class ItemsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]

  def index
    @items = Product.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
end

private

def item_params
  params.require(:item).permit(images_attributes: [:src, :_destroy, :id])
end

def set_product
  @item = Item.find(params[:id])
end