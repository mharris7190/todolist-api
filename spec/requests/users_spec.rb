require 'rails_helper'

RSpec.describe "Users", :type => :request do
  describe "GET /users" do
    it "retrieves all users" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /user/:id" do
  	it "retrieves a user from an id" do
  		testUser = User.create!(name: "test", email:"test@email.com")
  		get user_path(testUser)
  		expect(response).to have_http_status(200)
  	end
  end

  describe "POST /users#create" do
    it 'should add one user' do
      expect {
        post '/users.json', :user => {:name => 'Test', :login => 'test@test.com'}
      }.to change(User, :count).by(1)
    end
  end

end
