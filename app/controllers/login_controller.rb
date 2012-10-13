class LoginController < ApplicationController
  def new
		@login = Login.new
  end

  def create
    @login = Login.new params[:login]
    @user = @login.login
    if @user.nil?
      return render 'new'
    end

    session[:current_user] = @user.key
  end
end
