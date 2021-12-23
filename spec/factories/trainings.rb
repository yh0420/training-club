FactoryBot.define do
  factory :training do
    name { "腹筋" }
    user
  end
  
  trait :training_invalid do
    name { "" }
  end
end