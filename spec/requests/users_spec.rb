require 'rails_helper'

RSpec.describe 'Users', :type => :request do
  describe 'GET /users' do
    it 'retrieves all users' do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /user/:id' do
  	it 'retrieves a user from an id' do
  		testUser = User.create!(name: 'test', email:'test@email.com')
  		get user_path(testUser)
  		expect(response).to have_http_status(200)
  	end
  end

  describe 'POST create /users/1' do
    it 'should add one user' do
      expect {
        post '/users.json', :user => {:name => 'Test', :email => 'test@test.com'}
      }.to change(User, :count).by(1)
    end
  end

  describe 'PUT update /users/1' do
    it 'update the user' do
      @testUser = User.create!(name: 'test', email:'test@email.com')
      put '/users/1', :user =>  {:email => 'newemail@email.com'}
    end
  end

  describe 'DELETE destroy /users/1' do
    before do
      testUser = User.create!(name: 'test', email:'test@email.com')
    end

    it 'deletes the user' do
      expect{
        delete '/users/1'
        }.to change(User, :count).by(-1)
    end
  end

end
