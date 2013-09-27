class MessagesController < ApplicationController
	def new
		@user = current_user
		@users = User.all
		@message = Message.new()
	end

	def create
		@user = current_user
		@message = @user.sent_messages.create(params[:message].permit(:subject, :body, messages_users_attributes: [:user_id]))
		debugger
	end
end
