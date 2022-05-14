class Item < ApplicationRecord
  validates :name,                       presence: true
  validates :explanation,                presence: true
  validates :price,                      presence: true
  validates :category_id,                numericality: { other_than: 1 message: "can't be blank"}
  validates :condition_id,               numericality: { other_than: 1 message: "can't be blank"}
  validates :bear_id,                    numericality: { other_than: 1 message: "can't be blank"}
  validates :area_id,                    numericality: { other_than: 1 message: "can't be blank"}
  validates :delivery_day_id,            numericality: { other_than: 1 message: "can't be blank"}

  belongs_to :user
  has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :bear
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_day
end
