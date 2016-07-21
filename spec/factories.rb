FactoryGirl.define do
  factory :item do
    title "MyString"
    description "MyString"
    item_xp 1
    list_id 1
    item_creator 1
    purchaser_id 1
    list_id 1
    home_id 1
  end

  factory :user, aliases: [:creator, :chore_creator, :chore_assignee, :chore_completer] do
    sequence(:email) { |n| "email@example#{n}.com" }
    password "hunter2"
    # admin false
  end

  # factory :creator do
  #   association :creator, factory: :user
  # end
  #
  #
  factory :home do
    name Faker::Lorem.word
    creator
  end


  factory :chore, aliases: [:household_chore, :assigned_chore] do
    name Faker::Lorem.word
    value Faker::Number.between(1, 100)
    chore_creator
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
