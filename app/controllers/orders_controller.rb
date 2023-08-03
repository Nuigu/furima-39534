class OrdersController < ApplicationController
  before_action :set_item

  def index
    @order_form = OrderForm.new
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

  def order_form_params
    params.require(:order_form).permit(:postal_code, :city, :address, :building, :phone_number, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_8b163e713e4e112949548df8"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_form_params[:token],
      currency: 'jpy'
    )
  end
end
