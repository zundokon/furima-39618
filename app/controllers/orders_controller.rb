class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_public_key, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    @orderform = OrderForm.new 
    if current_user == @item.user || @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @orderform = OrderForm.new(order_params)
    if @orderform.valid?
      pay_item
      @orderform.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end
      
  private
    def order_params
      params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end

    def set_public_key
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    end
  
    def set_item
      @item = Item.find(params[:item_id])
    end

end
