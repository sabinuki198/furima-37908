FactoryBot.define do
  factory :user do
    nickname                   { Faker::Name.initials }
    email                      { Faker::Internet.free_email }
    password                   { 'attaka0101' }
    password_confirmation      { password }
    first_name                 { '蘇げブ' }
    last_name                  { '阿ばバ' }
    first_kana                 { 'ナマカナ' }
    last_kana                  { 'ミョウカナ' }
    birthday                   { Faker::Date.between(from: '2000-01-01', to: '2016-12-31') }
  end
end
