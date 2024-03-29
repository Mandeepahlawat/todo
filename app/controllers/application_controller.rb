class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
  	#debugger
  	user_tasks_path(current_user.id) 
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def no_task
    @user = current_user
    if !Task.find_by_user_id(params[:user_id])
      redirect_to new_user_task_path(@user.id), :notice => "Create your task here"
    end
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:avatar,:email, :password, :password_confirmation) }
  end
end
