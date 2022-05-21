class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :municipality, :address, :building, :tel, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipality, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :address
    validates :tel, format: { with: /\A[0-9]{10,11}\z/ }
    validates :token
  end
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, area_id: area_id, municipality: municipality, address: address,
                           building: building, tel: tel, purchase_id: purchase.id)
  end
end
