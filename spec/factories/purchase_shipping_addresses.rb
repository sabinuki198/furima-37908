FactoryBot.define do
  factory :purchase_shipping_address do
    postal_code            { '123-4567' }
    area_id                { '2' }
    municipality           { 'あぃうぇ尾' }
    address                { '中津3-1-20' }
    building               { 'IQ藤原3F-301' }
    tel                    { '12345678901' }
    token                  { 'tok_abcdefghijk00000000000000000' }
  end
end
