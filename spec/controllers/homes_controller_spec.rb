require 'rails_helper'

RSpec.describe HomesController, type: :controller do
render_views


  it "lets users create homes" do
    user = create :user
    sign_in user

    old_count = user.homes.count
    response = post :create, home: {name: "My New Home"}

    expect(response.status).to eq 201
    expect(user.homes.count).to eq old_count + 1
    expect(user.homes.last.name).to eq "My New Home"
  end



  it "lets users edit their homes" do
    user = create :user
    sign_in user

    home = post :create, home: {name: "Initial Home Name"}
    home = user.homes.last
    update = post :update, home: {name: "Edited Home Name"}, id: user.homes.last.id

    expect(user.homes.count).to eq 1
    expect(user.homes.last.name).to eq "Edited Home Name"
  end


  it "lets users delete homes" do
    user = create :user
    sign_in user

    home = post :create, home: {name: "My New Home"}

    home = Home.last
    count = user.homes.count
    response = delete :destroy, id: user.homes.last.id

    expect(response.status).to eq 200
    expect(user.homes.count).to eq count - 1
  end

end
