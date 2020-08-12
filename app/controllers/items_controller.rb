class ItemsController < ApplicationController
  before_action :set_category, only: [:edit, :update]
  before_action :set_category_child, only: [:edit, :update]
  before_action :set_category_grandchild, only: [:edit, :update]
  before_action :set_category_id, only: [:edit, :update]
  before_action :set_product, except: [@products, :index, :new, :create, :show, :edit, :update, :destroy, :get_category_children,:get_category_grandchildren]

  def set_product
    @products = Category.where(ancestry: nil)
  end

  def new
    @category_parent_array =  Category.where(ancestry: nil)    
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @category_parent_array =  Category.where(ancestry: nil)
      @item.images = []
      @item.images.new
      render action: :new
    end
  end

  def edit
    @category_parent_array =  Category.where(ancestry: nil)
    @item = Item.find(params[:id])
    @item.images.new
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      @item.images = []
      render action: :edit
    end
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
    @category = Category.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(id: params[:parent_name]).children
  end

 # 子カテゴリーが選択された後に動くアクション
 def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
 end

  private
  def item_params
    params.require(:item).permit(:name, :status, :cost, :day, :price, :description, :prefecture_id, :category_id, :brand, :user, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id, trading_status: 1)
  end

  def set_product
    @item = Item.find(params[:id])
  end

  def set_category
    @category_parent_array = Category.where(ancestry: nil)
  end

  # 子カテゴリの一覧作成(edit,update用)
  def set_category_child
    @item = Item.find(params[:id])
    @category_children_array = @item.category.parent.parent.children
  end

  # 孫カテゴリの一覧作成(edit,update用)
  def set_category_grandchild
    @category_grandchildren_array = @item.category.parent.children
  end

  #カテゴリーデータ取得(edit,update用)
  def set_category_id
    @grandchild = @item.category
    @child = @grandchild.parent
    @parent = @child.parent
  end

end
