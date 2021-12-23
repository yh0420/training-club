FactoryBot.define do
    factory :article do
      day { Faker::Date.in_date_period }
      minutes { Faker::Number.within(range: 1..360) }
      body { Faker::Lorem.paragraph }
      user
      training_id { FactoryBot.create(:training).id }
    end
  
    trait :invalid do
      body { nil }
    end
  end