class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def tweet_params
    params.require(:item).permit(:item_name, :explain, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :delivery_schedule_id, :price, :image).merge(user_id: current_user.id)
  end

end
