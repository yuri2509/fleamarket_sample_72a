class ItemsController < ApplicationController
  before_action :set_product, except: [@products, :index, :new, :create, :get_category_children,:get_category_grandchildren]

  def set_product
    @products = Category.where(ancestry: nil)
  end

  def new
    @category_parent_array =  Category.where(ancestry: nil) do |parent|
      @category_parent_array << parent
    end
    
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
      @category_parent_array =  Category.where(ancestry: nil) do |parent|
        @category_parent_array << parent
      end

      @item.images = []
      @item.images.new
      render :new
    end
  end

    @user = User.find(@item.user_id)
    @category = Category.find(params[:id])
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(id: params[:parent_name]).children
 end

 # 子カテゴリーが選択された後に動くアクション
 def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
 end
end

private

def item_params
  params.require(:item).permit(:name, :status, :cost, :day, :price, :description, :prefecture_id, :category_id, :brand, :user, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id, trading_status: 1)
end

def set_product
  @item = Item.find(params[:id])
end
