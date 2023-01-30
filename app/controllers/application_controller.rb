class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  # Find the current user based on session's user_id
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Check if there is a logged in user
  def logged_in?
    !!current_user
  end

  # Redirect user to login page if not logged in
  def require_user
   if !logged_in?
      flash[:notice] = "You must be logged in to perform that action"
     redirect_to login_path
   end
  end
end
