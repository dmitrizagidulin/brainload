ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'ripple/test_server'
require 'rails/test_help'

class ActiveSupport::TestCase	
  def login_as_valid_user
    session[:current_user] = 'bob@example.com'
  end

  def logout
    session.delete :current_user
  end

  def setup
		login_as_valid_user if defined? session
  end

end

class TestHelper < Test::Unit::TestCase

end

Ripple.config[:root] = Rails.root.join 'tmp', 'test.riak'
Ripple.config[:source] = ENV['RIAK_BIN_DIR']
Ripple::TestServer.setup