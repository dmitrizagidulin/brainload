ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'ripple/test_server'

class ActiveSupport::TestCase

  # fixtures :all

end

class TestHelper < Test::Unit::TestCase

end

Ripple.config[:root] = Rails.root.join 'tmp', 'test.riak'
Ripple.config[:source] = ENV['RIAK_BIN_DIR']
Ripple::TestServer.setup