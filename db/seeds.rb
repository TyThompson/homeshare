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
marias_home = Home.create(:name => "Maria's house", :creator_id => maria.id)

tys_home = Home.create(:name => "Ty's house", :creator_id => ty.id)


#Chores
5.times do Chore.create(:chore_creator_id => ty.id, :home_id => marias_home.id, :name => Faker::Lorem.word,
  :chore_xp => 100, :chore_completer_id => maria.id )
end

5.times do Chore.create(:chore_creator_id => maria.id, :home_id => tys_home.id, :name => Faker::Lorem.word,
  :chore_xp => 100, :chore_completer_id => ty.id )
end

#Users_Homes
marias_users_homes = UserHome.create(:user_id => maria.id, :home_id => marias_home.id,
 :exp => Chore.where(chore_completer_id: maria.id, home_id: marias_home.id).pluck(:chore_xp).sum, :admin => "true")

tys_users_homes = UserHome.create(:user_id => ty.id, :home_id => tys_home.id,
 :exp => Chore.where(chore_completer_id: ty.id, home_id: tys_home.id).pluck(:chore_xp).sum, :admin => "true")

#Bills
5.times do Bill.create(:user => maria, :home_id => marias_home.id, :name => Faker::Lorem.word,
  :amount => Faker::Commerce.price)
end

5.times do Bill.create(:user => ty, :home_id => tys_home.id, :name => Faker::Lorem.word,
  :amount => Faker::Commerce.price)
end


#Shopping Lists
5.times do List.create(:user_id => maria.id, :home_id => marias_home.id, :name => Faker::Lorem.word,
  :item => Faker::Lorem.word)
end

5.times do List.create(:user_id => ty.id, :home_id => tys_home.id, :name => Faker::Lorem.word,
  :item => Faker::Lorem.word)
end
