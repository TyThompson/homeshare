User.delete_all
Home.delete_all
Chore.delete_all
Bill.delete_all
List.delete_all
UserHome.delete_all
Item.delete_all


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
2.times do Chore.create(:chore_creator_id => ty.id, :home_id => marias_home.id, :name => Faker::Lorem.word,
  :chore_xp => 100, :chore_completer_id => maria.id, completed: true )
end

2.times do Chore.create(:chore_creator_id => ty.id, :home_id => marias_home.id, :name => Faker::Lorem.word,
  :chore_xp => 100, :chore_completer_id => maria.id, completed: false )
end


2.times do Chore.create(:chore_creator_id => maria.id, :home_id => tys_home.id, :name => Faker::Lorem.word,
  :chore_xp => 100, :chore_completer_id => ty.id, completed: true )
end

2.times do Chore.create(:chore_creator_id => maria.id, :home_id => tys_home.id, :name => Faker::Lorem.word,
  :chore_xp => 100, :chore_completer_id => ty.id, completed: false )
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
marias_shopping_list = List.create(:user_id => maria.id, :home_id => marias_home.id, :name => Faker::Lorem.word)


tys_shopping_list = List.create(:user_id => ty.id, :home_id => tys_home.id, :name => Faker::Lorem.word)



#Items
2.times do Item.create(:home_id => marias_home.id, :list_id => marias_shopping_list.id, :title => Faker::Lorem.word,
  :description => Faker::Lorem.sentence, :item_xp => 100, :purchaser_id => ty.id, :purchased => false)
end

2.times do Item.create(:home_id => marias_home.id, :list_id => marias_shopping_list.id, :title => Faker::Lorem.word,
  :description => Faker::Lorem.sentence, :item_xp => 100, :purchaser_id => ty.id, :purchased => true)
end

2.times do Item.create(:home_id => tys_home.id, :list_id => tys_shopping_list.id, :title => Faker::Lorem.word,
  :description => Faker::Lorem.sentence, :item_xp => 100, :purchaser_id => maria.id, :purchased => false)
end

2.times do Item.create(:home_id => tys_home.id, :list_id => tys_shopping_list.id, :title => Faker::Lorem.word,
  :description => Faker::Lorem.sentence, :item_xp => 100, :purchaser_id => maria.id, :purchased => true)
end
