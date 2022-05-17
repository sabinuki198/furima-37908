class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless @item.user_id == current_user.id
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_parameter)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_parameter
    params.require(:item).permit(:name, :image, :price, :explanation, :condition_id, :category_id, :area_id, :bear_id,
                                 :delivery_day_id).merge(user_id: current_user.id)
  end
end
