FactoryBot.define do
    factory :user do
        name { Faker::Name.name }
        email { Faker::Internet.unique.email }
        objective { '毎日５分運動する' }
        password { Faker::Internet.password(min_length: 6) }
        password_confirmation { password }
    end
end