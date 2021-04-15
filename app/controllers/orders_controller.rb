class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_top, only: [:index, :create]

  def index
    @order_destination = OrderDestination.new
  end

  def create
    @order_destination = OrderDestination.new(order_destination_params)
    if @order_destination.valid?
      pay_item
      @order_destination.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_top
    if current_user.id == @item.user_id
      return redirect_to root_path
    end
    if @item.order.present?
      return redirect_to root_path
    end
  end

  private

  def order_destination_params
    params.require(:order_destination).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token], price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_destination_params[:price],
      card: order_destination_params[:token],    
      currency: 'jpy'                
    )
  end

end
