class MessagesController < ApplicationController
  def index
    @items_category = Item.includes(:images).order('created_at DESC').limit(4)
    @items_brand = Item.includes(:images).order('created_at DESC').limit(4).where.not(brand: "")
  end
end
