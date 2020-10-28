class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :item, dependent: :destroy
  has_one    :address

end
