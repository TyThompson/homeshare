require 'rails_helper'

RSpec.describe ChoresController, type: :controller do



# #FAILING!!!!:
#   it "lets users add chores to a household they are a part of" do
#     user = create :user
#     sign_in user
#
#     home = create :home, creator_id: user.id
#
#     old_count = home.chores.count
#
#     response = post :create, chore: {name: "My New Chore", value: 100,
#       home_id: home.id}, chore_creator_id: user.id
#
#     expect(response.status).to eq 200
#     expect(home.chores.count).to eq old_count + 1
#     expect(home.chores.last.name).to eq "My New Chore"
#   end


#trying without factorygirl:
  it "lets users add chores to a household they are a part of" do
    user = User.create!(email: "blah@example.com", password: "password")

    home = Home.create!(name: "another home", creator_id: user.id)

    old_count = home.chores.count

    response = post :create, chore: {name: "Another Chore", value: 30, home_id: home.id}


    expect(response.status).to eq 200
    expect(home.chores.count).to eq old_count + 1
    expect(home.chores.last.name).to eq "My New Chore"
  end

end
