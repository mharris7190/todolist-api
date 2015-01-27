require 'rails_helper'

<<<<<<< HEAD
RSpec.describe 'Users', :type => :request do
  describe 'GET /users' do
    it 'retrieves all users' do
=======
RSpec.describe "Users", :type => :request do

  before(:each) do 
    @user1 = User.create!(name: "test", email:"test@email.com")
  end

  describe "GET /users" do
    it "retrieves all users" do
>>>>>>> 188759801fa1396bcf65a66ca5d5d1ea26323e70
      get users_path
      expect(response).to have_http_status(200)
    end
  end

<<<<<<< HEAD
  describe 'GET /user/:id' do
  	it 'retrieves a user from an id' do
  		testUser = User.create!(name: 'test', email:'test@email.com')
  		get user_path(testUser)
=======
  describe "GET /user/:id" do
  	it "retrieves a user from an id" do
  		get user_path(@user1)
>>>>>>> 188759801fa1396bcf65a66ca5d5d1ea26323e70
  		expect(response).to have_http_status(200)
  	end
  end

  describe 'POST create /users/:id' do
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

  describe 'PUT update /users/:id' do
    it 'update the user' do
      @testUser = User.create!(name: 'test', email:'test@email.com')
      put '/users/1', :user =>  {:email => 'newemail@email.com'}
    end
  end

  describe 'DELETE destroy /users/:id' do
    before do
      testUser = User.create!(name: 'test', email:'test@email.com')
    end

    it 'deletes the user' do
      expect{
        delete '/users/:id'
        }.to change(User, :count).by(-1)
    end
  end

end
