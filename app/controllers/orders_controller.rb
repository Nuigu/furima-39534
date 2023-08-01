class OrdersController < ApplicationController
  def new
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
  end

  private

  def order_params
    params.require(:order).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
