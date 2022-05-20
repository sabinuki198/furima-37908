class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :item_find, only: [:show, :edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_parameter)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @purchase_shipping_address  = PurchaseShippingAddress.new
  end

  def edit
    if @item.user_id != current_user.id
    redirect_to root_path
    elsif @item.purchase.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_parameter)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if user_signed_in? && item.user_id == current_user.id
      item.destroy
      redirect_to root_path
    else
      redirect_to item_path(item.id)
    end
  end

  private

  def item_parameter
    params.require(:item).permit(:name, :image, :price, :explanation, :condition_id, :category_id, :area_id, :bear_id,
                                 :delivery_day_id).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end
end
