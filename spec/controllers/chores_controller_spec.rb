require 'rails_helper'

RSpec.describe ChoresController, type: :controller do


#BROKEN:
  it "lets users add chores to a household they are a part of" do
    user = create :creator
    sign_in user

    home = create :home, creator_id: user.id

    old_count = user.household_chores.count
    response = post :create, chore: {name: "My New Chore", value: 100}, home_id: home.id, user_id: user.id

    expect(response.status).to eq 200
    expect(user.household_chores.count).to eq old_count + 1
    expect(user.household_chores.last.name).to eq "My New Chore"
  end

end
