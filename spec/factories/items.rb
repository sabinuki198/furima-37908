FactoryBot.define do
  factory :item do
    name                       { 'テストカード' }
    explanation                { '20thシークレット仕様です' }
    category_id                { '2' }
    condition_id               { '2' }
    bear_id                    { '2' }
    area_id                    { '2' }
    delivery_day_id            { '2' }
    price                      { '10000' }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
