FactoryBot.define do
  factory :item do
    


    
    association :user

    after(:build) do |item|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
