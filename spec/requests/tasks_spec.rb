require 'rails_helper'

RSpec.describe 'Tasks', :type => :request do

  before(:each) do 
    @user1 = User.create!(name: "test", email:"test@email.com")
    @task1 = @user1.tasks.create!(description: "task1", due_date: "2/1/15")
    @task2 = @user1.tasks.create!(description: "task2", due_date: "2/2/15")
  end

  describe 'GET users/1/tasks' do
    it 'works! (now write some real specs)' do
      get user_tasks_path(@task1)
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET users/:id/tasks/:id' do
  	it 'works!' do
  		get user_task_path(@task1, @user1)
  		expect(response).to have_http_status(200)
  	end
  end

  describe 'POST /users/:id/tasks/:id#create' do
    # PRIYA's CODE: Wasn't doing anything
    # before do
    #   test_user = User.create!(name: 'Andy Dick', email: 'test@email.com')
    # end

    # it 'add task to user' do
    #   expect {
    #     post '/users/1/tasks/1', :task => {description: 'Test Task', due_date: '1/30/15'}
    #   }
    # end

    before(:each) do
      post user_tasks_path(@user1, task: {description: "task3", due_date: "2/3/15", user_id: @user1.id})
    end

    it "adds a task to the db" do
      expect(Task.all.count).to eq(3)
    end

    it "associates the added task with the correct user" do
      expect(@user1.tasks.count).to eq(3)
    end
  end

  describe 'PUT /users/:id/tasks/:id#update' do
    it 'update the user' do
      test_user = User.create!(name: 'Andy Dick', email: 'test@email.com')
      test_task = test_user.tasks.create!(description: 'Test Task', due_date: '1/30/15')
      put '/users/1/tasks/1', :task =>  {:due_date => '2/05/15'}
    end
  end

  describe 'DELETE destroy /users/:id/tasks/:id' do
    before do
      test_user = User.create!(name: 'test', email:'test@email.com')
      test_task = test_user.tasks.create!(description: 'Test Task', due_date: '1/30/15')
    end

    it 'deletes the task' do
      delete '/users/1/tasks/1'
    end
  end

end
