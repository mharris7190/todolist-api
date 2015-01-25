class AddUserIdToTasks < ActiveRecord::Migration
  def up
  	add_column :tasks, :user_id, :string
  end

  def down
  	remove_column :tasks, :user_id, :string
  end
end
