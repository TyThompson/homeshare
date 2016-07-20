require 'rails_helper'

RSpec.describe HomesController, type: :controller do
render_views

  it "lets users create homes" do
    user = create :user
    sign_in user

    old_count = user.homes.count
    response = post :create, home: {name: "home_name"}
    # expect(response.status).to eq 302
    expect(user.homes.count).to eq old_count + 1
    expect(user.homes.last.name).to eq "home_name"
  end

end
