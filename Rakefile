#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

R12Team241::Application.load_tasks

require './config/environment'
require './lib/tasks/seed'


task :drop do
  user = User.find_by_index(:email, "bob@example.com").first
  CardDeck.find_by_index(:user_key, user.key).each { |cd| cd.destroy! }
end