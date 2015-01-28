require 'rails_helper'

RSpec.describe "Users", :type => :request do

  before(:each) do 
    @user1 = User.create!(name: "test", email:"test@email.com")
  end

  describe "GET /users" do
    it "retrieves all users" do
      get api_v1_users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /user/:id" do
  	it "retrieves a user from an id" do
  		get api_v1_user_path(@user1)
  		expect(response).to have_http_status(200)
  	end
  end

  describe 'POST create /users/:id' do
    it 'should add one user' do
      expect {
        post 'api/v1/users.json', :user => {:name => 'Test', :email => 'test@test.com'}
      }.to change(User, :count).by(1)
    end

    it 'should get 201 status code' do
      post api_v1_users_path(user: {name: "Test", email: "test@test.com"})
      expect(response).to have_http_status(201)
    end 
  end

  describe 'PUT update /users/:id' do
    it 'update the user' do
      @testUser = User.create!(name: 'test', email:'test@email.com')
      put 'api/v1/users/1', :user =>  {:email => 'newemail@email.com'}
    end
  end

  describe 'DELETE destroy /users/:id' do
    it 'deletes the user' do
      expect{
        delete "api/v1/users/1"
        }.to change(User, :count).by(-1)
    end
  end

end
