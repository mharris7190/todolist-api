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
  		get user_task_path(@user1, @task2)
  		expect(response).to have_http_status(200)
  	end
  end


  describe 'POST /users/:id/tasks/:id#create' do
    before(:each) do
      post(user_tasks_path(@user1), task: {description: "task3", due_date: "2/3/15"})
    end

    it "adds a task to the db" do
      expect(Task.all.count).to eq 3
    end

    it "associates the added task with the correct user" do
      expect(@user1.tasks.count).to eq 3
    end
  end



  describe 'PUT /users/:id/tasks/:id#update' do
    before(:each) do
      put("users/1/tasks/1", {description: "updated task1"})
    end

    it 'description should not still be the same' do
      expect(JSON.parse(response.body)['description']).to_not eq("task1")
    end

    it 'updates the task description correctly' do
      expect(JSON.parse(response.body)['description']).to eq "updated task1"
    end
  end



  describe 'DELETE destroy /users/:id/tasks/:id' do

    it 'deletes task1 from user1' do
      preCount = @user1.tasks.count
      delete 'users/1/tasks/1'
      expect(@user1.tasks.count).to eq(preCount-1)
    end
  end
end
