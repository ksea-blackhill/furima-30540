FactoryBot.define do
  factory :item do
    name        {'商品名'}
    description {'説明文'}
    category_id {2}
    status_id   {2}
    cost_id     {2}
    area_id     {2}
    day_id      {2}
    price       {300}
    association :user
  end
end

