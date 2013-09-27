class TodosController < ApplicationController
	# before_action :no_todo,:only=> [:index]
	def index
		@user = current_user
		@task = Task.find(params[:task_id])
		@todos = Todo.search(params[:search],@task,@user.id)
		@todo = Todo.new
		respond_to do |format|
	    format.html
	    format.csv { send_data @todos.to_csv }
	    format.xls { send_data @todos.to_csv(col_sep: "\t") }
  	end
	end

	def new
		@user = current_user
		@todo = Todo.new
	end

	def create
		#debugger
		@user = current_user
		@task = @user.tasks.find(params[:task_id])
		respond_to do |format|
			@todo = @task.todos.create(params[:todo].permit(:title, :category_id))
			format.html {redirect_to user_task_todos_path(@user.id,@task.id), notice: 'todo has been created'}
			format.js {render 'create'}
		end
	end

	def update
		@user = current_user
		@todo = Todo.find(params[:id])
		if @todo.update_attribues[params[:todo]]
			respond_to do |format|
				format.html {redirect_to user_todos_path(@user.id), notice: "successfully complete"}
				format.js {}
			end
		else
			respond_to do |format|
				fomat.html {redirect_to user_todos_path(@user.id), notice: "couldn't complete"}
			end
		end  
	end

	def destroy
		@user = current_user
		@todo = Todo.find(params[:id])
		@todo.destroy
		redirect_to user_todos_path(@user.id)
	end
	

	def toggle_field
		@user = current_user
		@todo = Todo.find(params[:id])
		@todo.toggle(:completed)
		@todo.save
		respond_to do |format|
			format.js{}
		end
	end
end
