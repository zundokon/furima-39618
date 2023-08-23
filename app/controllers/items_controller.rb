class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, ]

  def show
    @item = Item.find(params[:id])
    @user = @item.user

  end

  def index
    @items = Item.all.order(created_at: :desc)
  end


  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id 
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
    render:edit, status: :unprocessable_entity
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_duration_id, :price,).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
