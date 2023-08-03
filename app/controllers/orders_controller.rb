class OrdersController < ApplicationController
  before_action :require_signin
  before_action :set_item
  before_action :seller_cannot_buy

  def index
    orders = Order.pluck(:item_id)
    if orders.include?(@item.id)
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      @order_form = OrderForm.new
    end
  end

  def create
    @order_form = OrderForm.new(order_form_params)
    if @order_form.save
      pay_item
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def require_signin
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def seller_cannot_buy
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def order_form_params
    params.require(:order_form).permit(:postal_code, :city, :address, :building, :phone_number, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_form_params[:token],
      currency: 'jpy'
    )
  end
end
