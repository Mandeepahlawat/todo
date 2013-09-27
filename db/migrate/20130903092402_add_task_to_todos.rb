class AddTaskToTodos < ActiveRecord::Migration
  def change
  	change_table :todos do |t|
  		t.references :task, index: true
  	end
  end
end
