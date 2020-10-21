FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { '1Aa' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birthday              { Faker::Date.birthday }
    first_name            { '新庄' }
    last_name             { '剛志' }
    kana_first            { 'シンジョウ' }
    kana_last             { 'ツヨシ' }
  end
end
