class ItemsController < ApplicationController

  before_action :move_to_signin, only: [:new, :create, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_orders, only: [:index, :show, :edit]
  before_action :protect_item, only: [:edit, :destroy]

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

  def show
  end

  def edit
    if @orders.include?(@item.id)
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :price, :category_id, :quality_id, :delivery_cost_id, :prefecture_id, :delivery_time_id, :image).merge(user_id: current_user.id)
  end

  def move_to_signin
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_orders
    @orders = Order.pluck(:item_id)
  end

  def protect_item
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
