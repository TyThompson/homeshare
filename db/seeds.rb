User.delete_all
Home.delete_all
Chore.delete_all
Bill.delete_all
List.delete_all
UserHome.delete_all
Item.delete_all


#Users
maria = User.create(:email => 'maria@example.com', :password => 'password', paypal_email: 'maria@payment.com',
 :site_admin => true)

travis = User.create(:email => 'travis@example.com', :password => 'password', paypal_email: 'travis@payment.com')

ty = User.create(:email => 'ty@example.com', :password => 'password', paypal_email: 'ty@payment.com')
erik = User.create(:email => 'erik@example.com', :password => 'password', paypal_email: 'erik@payment.com')


5.times do User.create(:email => Faker::Internet.email,
  :password => Faker::Internet.password)
end


#Homes
marias_home = Home.create(:name => "Maria's house", :creator_id => maria.id)

tys_home = Home.create(:name => "Ty's house", :creator_id => ty.id)

eriks_home = Home.create(:name => "Erik's house", :creator_id => erik.id)


#Chores
2.times do Chore.create(:chore_creator_id => ty.id, :home_id => marias_home.id, :name => Faker::Lorem.word,
  :chore_xp => Faker::Number.between(1, 100), :chore_completer_id => maria.id, completed: true )
end

2.times do Chore.create(:chore_creator_id => ty.id, :home_id => marias_home.id, :name => Faker::Lorem.word,
  :chore_xp => Faker::Number.between(1, 100), :chore_completer_id => maria.id, completed: false )
end


2.times do Chore.create(:chore_creator_id => maria.id, :home_id => tys_home.id, :name => Faker::Lorem.word,
  :chore_xp => Faker::Number.between(1, 100), :chore_completer_id => ty.id, completed: true )
end

2.times do Chore.create(:chore_creator_id => maria.id, :home_id => tys_home.id, :name => Faker::Lorem.word,
  :chore_xp => Faker::Number.between(1, 100), :chore_completer_id => ty.id, completed: false )
end

2.times do Chore.create(:chore_creator_id => ty.id, :home_id => eriks_home.id, :name => Faker::Lorem.word,
  :chore_xp => Faker::Number.between(1, 100), :chore_completer_id => maria.id, completed: true )
end

#Users_Homes
marias_userhomes = UserHome.create(:user_id => maria.id, :home_id => marias_home.id,
 :exp => Chore.where(chore_completer_id: maria.id, home_id: marias_home.id).pluck(:chore_xp).sum, :admin => "true")

tys_userhomes = UserHome.create(:user_id => ty.id, :home_id => tys_home.id,
 :exp => Chore.where(chore_completer_id: ty.id, home_id: tys_home.id).pluck(:chore_xp).sum, :admin => "true")

eriks_userhomes = UserHome.create(:user_id => erik.id, :home_id => eriks_home.id,
  :exp => Chore.where(chore_completer_id: erik.id, home_id: eriks_home.id).pluck(:chore_xp).sum, :admin => "true")

  #Travis is a housemate in a home Maria created:
  travis_userhomes = UserHome.create(:user_id => travis.id, :home_id => marias_home.id,
    :exp => Chore.where(chore_completer_id: travis.id, home_id: marias_home.id).pluck(:chore_xp).sum, :admin => "false")


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
  :description => Faker::Lorem.sentence, :item_xp => 50, :purchaser_id => ty.id, :purchased => false)
end

2.times do Item.create(:home_id => marias_home.id, :list_id => marias_shopping_list.id, :title => Faker::Lorem.word,
  :description => Faker::Lorem.sentence, :item_xp => 50, :purchaser_id => ty.id, :purchased => true)
end

2.times do Item.create(:home_id => tys_home.id, :list_id => tys_shopping_list.id, :title => Faker::Lorem.word,
  :description => Faker::Lorem.sentence, :item_xp => 50, :purchaser_id => maria.id, :purchased => false)
end

2.times do Item.create(:home_id => tys_home.id, :list_id => tys_shopping_list.id, :title => Faker::Lorem.word,
  :description => Faker::Lorem.sentence, :item_xp => 50, :purchaser_id => maria.id, :purchased => true)
end


#Payments
2.times do Payment.create(:title => Faker::Lorem.word, :description => Faker::Lorem.sentence, :amount => Faker::Commerce.price,
  :sender_id => maria.id, :sender_paypal_email => maria.paypal_email, :recipient_id => ty.id,
  :recipient_paypal_email => ty.paypal_email)
end

2.times do Payment.create(:title => Faker::Lorem.word, :description => Faker::Lorem.sentence, :amount => Faker::Commerce.price,
  :sender_id => ty.id, :sender_paypal_email => ty.paypal_email, :recipient_id => maria.id,
  :recipient_paypal_email => maria.paypal_email)
end
