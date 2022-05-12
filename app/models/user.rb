class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/ }
         validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥]+\z/ }
         validates :first_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :last_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :birthday, presence: true

         has_many :items
         has_many :purchases

end
