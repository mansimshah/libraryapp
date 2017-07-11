require 'rails_helper'

RSpec.describe Api::V1::RegistrationsController, type: :controller do


  let(:user) { FactoryGirl.create(:user) }

  # after(:each) do
  #   puts "Runs after each Example"
  #   # @request.env["devise.mapping"] = Devise.mappings[:user]
  # end

  # TODO
  describe "POST 'create'" do
  #
    it "register a User" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
  #
  #     # expect(user.email) == expect(user.password) == expect(user.password_confirmation) != nil
  #     # expect(user.email) == user_email
  #     # expect(user.password) == password
  #     # expect(user.password_confirmation) == password

      puts "==new user===",user.inspect
      puts "==class===",user.class

      # User.create!(user.attributes)

      # expect {
      #   post :create, user: (user)
      # }.to change(User, :count).by(1)


      # expect_any_instance_of(User).to receive(:create).with(ActionController::Parameters.new(user))

      # controller.send(:build_resource)

      # User.create!(user.attributes)
      # login_as(user, scope: user)

      post :create, user: user
      expect(assigns(:user)).to be_persisted
      # sign_in user

      puts "==after===new user===",user.inspect
      puts "==after class======",user.class

      expect(response.status).to eql(200)

    end

  end

end