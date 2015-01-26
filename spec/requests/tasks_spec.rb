require 'rails_helper'



RSpec.describe "Tasks", :type => :request do
  describe "GET users/1/tasks" do
    it "works! (now write some real specs)" do
      get user_tasks_path(1)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET users/1/tasks/1" do
  	it "works!" do
  		test_user = User.create!(name: "Andy Dick", email: "test@email.com")
  		test_task = test_user.tasks.create!(description: "Test Task", due_date: "1/30/15")
  		get user_task_path(test_user,test_task)
  		expect(response).to have_http_status(200)
  	end
  end
end
