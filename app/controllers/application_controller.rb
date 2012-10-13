class ApplicationController < ActionController::Base
  protect_from_forgery
  def current_user
    # HACK is temporary
    User.find_by_index(:email, "bob@example.com").first
  end
end
