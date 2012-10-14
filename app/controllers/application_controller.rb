class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def current_user
    return @current_user if defined? @current_user
    return nil unless session[:current_user]
    @current_user = User.find(session[:current_user])
    return @current_user unless @current_user.nil?

    return session[:current_user] = nil
  end

  def equivalent_user
    current_user || NullUser.new
  end

  def require_user
    return true unless current_user.nil?

    redirect_to login_path
  end

  def require_no_user
    return true if current_user.nil?

    redirect_to home_path
  end
end