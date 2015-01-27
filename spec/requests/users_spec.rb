require 'rails_helper'

RSpec.describe "Users", :type => :request do

  before(:each) do 
    @user1 = User.create!(name: "test", email:"test@email.com")
  end

  describe "GET /users" do
    it "retrieves all users" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /user/:id" do
  	it "retrieves a user from an id" do
  		get user_path(@user1)
  		expect(response).to have_http_status(200)
  	end
  end

  describe "POST /users#create" do
    it 'should add one user' do
      expect {
        post '/users.json', :user => {:name => 'Test', :email => 'test@test.com'}
      }.to change(User, :count).by(1)
    end

    it 'shoud get 201 status code' do
      post users_path(user: {name: "Test", email: "test@test.com"})
      expect(response).to have_http_status(201)
    end 
  end

end
