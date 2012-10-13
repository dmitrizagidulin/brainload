class LoginController < ApplicationController
  def new
		@login = Login.new
  end

  def create
    @login = Login.new params[:login]
    session[:current_user] = @login.login
  end
end
