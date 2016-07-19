User.delete_all
Home.delete_all
Chore.delete_all
Bill.delete_all
List.delete_all
UserHome.delete_all


#Users
maria = User.create(:email => 'maria@example.com', :password => 'password', :site_admin => true)
ty = User.create(:email => 'ty@example.com', :password => 'password')

20.times do User.create(:email => Faker::Internet.email,
  :password => Faker::Internet.password)
end


#Homes
marias_home = Home.create(:name => "Maria's house", :user_id => maria.id)

tys_home = Home.create(:name => "Ty's house", :user_id => ty.id)


#Chores
5.times do Chore.create(:user => maria, :user_id => maria.id, :home_id => marias_home.id, :name => Faker::Lorem.sentence,
  :value => Faker::Number.between(1, 100) )
end

5.times do Chore.create(:user => ty, :user_id => ty.id, :home_id => tys_home.id, :name => Faker::Lorem.sentence,
  :value => Faker::Number.between(1, 100))
end

#Users_Homes
marias_users_homes = UserHome.create(:user_id => maria.id, :home_id => marias_home.id,
 :exp => Chore.where(user_id: maria.id).pluck(:value).sum, :admin => "true")

tys_users_homes = UserHome.create(:user_id => ty.id, :home_id => tys_home.id,
 :exp => Chore.where(user_id: maria.id).pluck(:value).sum, :admin => "false")

#Bills
5.times do Bill.create(:user => maria, :home_id => marias_home.id, :name => Faker::Lorem.sentence,
  :amount => Faker::Commerce.price)
end

5.times do Bill.create(:user => ty, :home_id => tys_home.id, :name => Faker::Lorem.sentence,
  :amount => Faker::Commerce.price)
end


#Shopping Lists
5.times do List.create(:user_id => maria.id, :home_id => marias_home.id, :name => Faker::Lorem.sentence,
  :item => Faker::Lorem.sentence)
end

5.times do List.create(:user_id => ty.id, :home_id => tys_home.id, :name => Faker::Lorem.sentence,
  :item => Faker::Lorem.sentence)
end
