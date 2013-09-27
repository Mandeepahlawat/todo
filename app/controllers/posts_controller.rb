class PostsController < ApplicationController
	def index
		@user= current_user
		@posts = @user.posts.all if !@user.posts.nil?
	end

	def create
		@user = current_user
		fb_client = FacebookTodo.new(@user.facebook_token)
		@status = fb_client.get_status
		if @status[:status] ==  true
			@post = @user.posts.create(:user_id => @user.id, :title => @status[:message])
			redirect_to user_posts_path
		else 
			redirect_to user_posts_path, :notice => "#{@status[:message]}"
		end
	end
end
