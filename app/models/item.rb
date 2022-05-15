class Item < ApplicationRecord
  validates :name,                       presence: true
  validates :explanation,                presence: true
  validates :price,                      presence: true, format: { with: /\A[0-9]+\z/ },
                                         numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id,                numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,               numericality: { other_than: 1, message: "can't be blank" }
  validates :bear_id,                    numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id,                    numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_day_id,            numericality: { other_than: 1, message: "can't be blank" }
  validates :image,                      presence: true, blob: { content_type: :image }

  belongs_to :user
  #has_one :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :bear
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_day
end
