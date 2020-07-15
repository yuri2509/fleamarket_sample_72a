class ItemsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]

  def index
    @items = Product.includes(:images).order('created_at DESC')
  end

  def new
    @category_parent_array = ["---"]
      #データベースから、親カテゴリーのみ抽出し、配列化
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end
    
    # @parents = Category.all.order("id ASC").limit(13)
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
    # binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
 end

 # 子カテゴリーが選択された後に動くアクション
 def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
 end
end

# def search
#   respond_to do |format|
#     format.html
#     format.json do
#      @children = Category.find(params[:parent_id]).children
#      #親ボックスのidから子ボックスのidの配列を作成してインスタンス変数で定義
#     end
#   end
# end

private

def item_params
  params.require(:item).permit(images_attributes: [:src, :_destroy, :id])
end

# def set_product
#   @item = Item.find(params[:id])
# end