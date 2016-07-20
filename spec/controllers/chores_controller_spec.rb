require 'rails_helper'

RSpec.describe ChoresController, type: :controller do


#BROKEN:
  it "lets users create chores" do
    user = create :user
    sign_in user

    old_count = user.chores.count
    response = post :create, chore: {name: "My New Chore", value: 100}, home_id: home.id

    # expect(response.status).to eq 302
    expect(chores.count).to eq old_count + 1
    expect(user.chores.last.name).to eq "My New Chore"
  end

end
