require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address, user_id: user.id, item_id: item.id)
    sleep 0.05
  end
  describe '商品購入機能' do
    context '購入できる場合' do
      it '全ての値正しく入力されている場合に購入できる' do
        expect(@purchase_shipping_address).to be_valid
      end
      it 'buidingが空でも購入できる' do
        @purchase_shipping_address.building = ''
        expect(@purchase_shipping_address).to be_valid
      end
    end
    context '購入できない場合' do
      it 'postal_codeが空の場合には購入できない' do
        @purchase_shipping_address.postal_code = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角数字3桁-(ハイフン)半角数字4桁以外では購入できない' do
        @purchase_shipping_address.postal_code = '1234-56789'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeが全角数字では購入できない' do
        @purchase_shipping_address.postal_code = '１２３-４５６７'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeがハイフン無しでは購入できない' do
        @purchase_shipping_address.postal_code = '123456'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'area_idが空の場合には購入できない' do
        @purchase_shipping_address.area_id = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'area_idが1の場合には購入できない' do
        @purchase_shipping_address.area_id = '1'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipalityが空の場合には購入できない' do
        @purchase_shipping_address.municipality = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'municipalityが全角かな、カナ、漢字以外では購入できない' do
        @purchase_shipping_address.municipality = 'ｱｲｳｴｵ'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Municipality is invalid')
      end
      it 'addressが空の場合には購入できない' do
        @purchase_shipping_address.address = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'telが空の場合には購入できない' do
        @purchase_shipping_address.tel = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telが全角数字の場合には購入できない' do
        @purchase_shipping_address.tel = '１２３４５６７８９０'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Tel is invalid')
      end
      it 'telが9桁未満の場合には購入できない' do
        @purchase_shipping_address.tel = '123456789'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Tel is invalid')
      end
      it 'telが12桁より多い場合には購入できない' do
        @purchase_shipping_address.tel = '123456789012'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include('Tel is invalid')
      end
      it 'tokenが空の場合には購入できない' do
        @purchase_shipping_address.token = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが紐づけられていない場合には購入できない' do
        @purchase_shipping_address.user_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づけられていない場合には購入できない' do
        @purchase_shipping_address.item_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
