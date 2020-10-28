class Address < ApplicationRecord
  belongs_to :payment

  with_options presence: true do
    validates :postal_code
    validates :municipality
    validates :banchi
    validates :tel
  end

  validates :area_id, numericality: { other_than: 1 } 
end
