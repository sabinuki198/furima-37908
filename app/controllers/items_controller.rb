class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
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

  private

  def item_parameter
    params.require(:item).permit(:name, :image, :price, :explanation, :condition_id, :category_id, :area_id, :bear_id,
                                 :delivery_day_id).merge(user_id: current_user.id)
  end
end
