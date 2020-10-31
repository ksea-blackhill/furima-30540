class Form
  include ActiveModel::Model
  attr_accessor :token,:postal_code,:area_id,:municipality,:banchi,:building,:tel,:payment_id,:user_id,:item_id

  with_options presence: true do
    validates :token
    validates :postal_code, format:{with: /\A\d{3}[-]\d{4}\z/}
    validates :municipality
    validates :banchi
    validates :tel,         format:{with: /\A\d{10,11}\z/}
  end

  validates :area_id, numericality: { other_than: 1 } 

  def save
    payment = Payment.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, banchi: banchi, building: building, tel: tel, payment_id: payment.id)
  end
end