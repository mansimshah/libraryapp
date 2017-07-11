require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do

  let(:user) { FactoryGirl.create(:user) }

  it "blocks unauthenticated access" do
    puts "=====user====",user.inspect
    # sign_in nil
    login_as(nil, scope: user)
    expect(user.email) != nil
    expect(user.password) != nil
  end

  it "allows authenticated access" do
    # sign_in user
    login_as(user, scope: user)
    allow(user).to receive(:email).and_return(user.authentication_token)
    # expect(response).to be_success
    expect(response.status).to eql(200)
  end

  it "allows logout to User" do
    login_as(user, scope: user)

    logout(user)
    # expect(response).to be_success
    expect(response.status).to eql(200)


    # Till not figured out how to assert Warden has successfully logged in the user like we can do in a Devise controller spec by asserting subject.current_user. If anybody knows a way to do it please share.
    # expect(subject.current_user).to_not be_nil

    # xhr :delete, :destroy
    #
    # expect(response).to have_http_status(204)

  end

end