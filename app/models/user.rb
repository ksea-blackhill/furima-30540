class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :last_name
    validates :kana_first
    validates :kana_last
    validates :birthday
    validates :email, uniqueness: true
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-zA-Z\d]{6,50}+\z/.freeze
    validates :password, format: { with: VALID_PASSWORD_REGEX }
  end

  with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
    validates :first_name
    validates :last_name
  end

  with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :kana_first
    validates :kana_last
  end
end
