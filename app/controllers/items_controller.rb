class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

#  詳細機能
#   def show
#   end
#  詳細機能

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

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_duration_id, :price,).merge(user_id: current_user.id)
  end

end
