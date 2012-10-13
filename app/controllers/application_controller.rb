class ApplicationController < ActionController::Base
  protect_from_forgery
  def current_user
    if session and session[:current_user]
      user = User.find_by_index(:email, session[:current_user]).first
    else
      user = nil
    end
    return user
  end
end
