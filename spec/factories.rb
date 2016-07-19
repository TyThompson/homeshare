FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "email@example#{n}.com" }
    password "hunter2"
    admin false

    factory :admin do
      admin true
    end
  end


    factory :home do
      name Faker::Lorem.word
      user
    end


  factory :chore do
    name Faker::Lorem.word
    value Faker::Number.between(1, 100)
    user
    home
  end


  factory :bill do
    name Faker::Lorem.word
    amount Faker::Commerce.price
    user
    home
  end


  factory :list do
    name Faker::Lorem.word
    item Faker::Lorem.word
    user
    home
  end


end
