require 'rails_helper'

RSpec.describe HomesController, type: :controller do

  it "lets users create homes" do
    user = create :user
    sign_in user

    old_count = user.homes.count
    response = post :create, home: {name: "home_name"},  user_id: user.id#, home_id: home.id

    expect(response.status).to eq 302
    expect(home.count).to eq old_count + 1
    expect(home.last.name).to eq 'home_name'

  end


end
