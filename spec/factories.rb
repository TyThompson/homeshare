FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "email@example#{n}.com" }
    password "hunter2"
    admin false

    factory :admin do
      admin true
    end
  end

#   factory :item do
#   name Faker::Beer.name
#   description Faker::Beer.style
#   price 5.00
#   user
#   shop
# end
#
#
# factory :shop do
#   name "User Shop"
#   description "my awesome shop"
#   location "my town"
#   user
# end







  end
