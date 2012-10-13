class ApplicationController < ActionController::Base
  protect_from_forgery
  def current_user
    # HACK is temporary
    User.find_by_index(:email, "bob@example.com").first || (@user=User.new(:email => "bob@example.com", :password => "231de2ewqa"); @user.save!)
  end
end
