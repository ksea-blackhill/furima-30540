FactoryBot.define do
  factory :form do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {'566-1111'}
    area_id     { 2 }
    municipality {'東京都'}
    banchi      {'港区１−１'}
    building    {'マンション３０３'}
    tel         {'09000000000'}
    #assosiation :item
  end
end
