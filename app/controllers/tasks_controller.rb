class TasksController < ApplicationController
	before_action :no_task,:only=> [:index]
	protect_from_forgery :only => [:create, :update, :destroy]
	skip_before_filter :verify_authenticity_token
	def new
		@user = current_user
		@task = Task.new
	end

	def index
		@user = current_user
		@tasks = Task.where(:user_id => @user.id)
		@task = Task.new
	end

	def create
		@user = current_user
		respond_to do |format|
			@task = @user.tasks.create(params[:task].permit(:title,:upl_tasks))
			format.html {redirect_to user_tasks_path(@user.id), notice: 'task has been created'}
			format.js {}
		end
	end

	def destroy
		@user = current_user
		@task = Task.find(params[:id])
		@task.destroy
		redirect_to user_tasks_path(@user.id)
	end

	def import
		@user = current_user
	  Task.import(params[:file])
	  redirect_to user_tasks_path(@user.id), notice: "Products imported."
	end

end
