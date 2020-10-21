class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,      presence: true
  validates :first_name,    presence: true
  validates :last_name,     presence: true
  validates :kana_first,    presence: true
  validates :kana_last,     presence: true
  validates :birthday,      presence: true
  validates :email,         uniqueness: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-zA-Z\d]{6,50}+\z/
   validates :password, presence: true,format: { with: VALID_PASSWORD_REGEX}
end 
