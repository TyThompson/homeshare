# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Users
maria = User.create(:email => 'maria@example.com', :password => 'password')
ty = User.create(:email => 'ty@example.com', :password => 'password')

20.times do User.create(:email => Faker::Internet.email,
  :password => Faker::Internet.password, :admin => false)
end


#Homes
marias_home = Home.create(:name => "Maria's house", :user => maria)

tys_home = Home.create(:name => "Ty's house", :user => ty)


#Chores
5.times do Chore.create(:user => maria, :home => marias_home, :name => Faker::Lorem.sentence,
  :value => Faker::Number.between(1, 100) )
end

5.times do Chore.create(:user => ty, :home => tys_home, :name => Faker::Lorem.sentence,
  :value => Faker::Number.between(1, 100))
end


#Bills
5.times do Bill.create(:user => maria, :home => marias_home, :name => Faker::Lorem.sentence,
  :amount => Faker::Commerce.price)
end

5.times do Bill.create(:user => ty, :home => tys_home, :name => Faker::Lorem.sentence,
  :amount => Faker::Commerce.price)
end


#Shopping Lists
5.times do Shopping_List.create(:user => maria, :home => marias_home, :name => Faker::Lorem.sentence,
  :item => Faker::Lorem.sentence)
end

5.times do Shopping_List.create(:user => ty, :home => tys_home, :name => Faker::Lorem.sentence,
  :amount => Faker::Lorem.sentence)
end
