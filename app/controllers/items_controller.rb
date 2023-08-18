class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

#  詳細機能
#   def show
#   end
#  詳細機能

private

  def item_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

end
