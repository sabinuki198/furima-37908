class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :item_find, only: [:index, :create]
  def index
    @purchase_shipping_address  = PurchaseShippingAddress.new
    if @item.user_id == current_user.id
      redirect_to root_path 
    elsif @item.purchase.present?
      redirect_to root_path 
    end
  end

  def create
    @purchase_shipping_address  = PurchaseShippingAddress.new(purchase_params)
    if @purchase_shipping_address.valid?
      pay_item
      @purchase_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end
 

  private
  def purchase_params
    params.require(:purchase_shipping_address).permit(:postal_code, :area_id, :municipality, :address, :building, :tel, :item_id, ).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

end
