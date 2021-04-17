FactoryBot.define do
  factory :order_destination do
    postal_code  {'123-4567'} 
    prefecture_id  {2}  
    city  {'目黒区'} 
    address  {'東山3-4-2'} 
    building  {'くるみハイツ'} 
    phone_number  {'0901234567'}
    price {3000}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
