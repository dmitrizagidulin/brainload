#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

R12Team241::Application.load_tasks

require './config/environment'
require './lib/tasks/seed'


task :drop do
  CardDeck.find_by_index('$bucket','_').each { |cd| cd.destroy! }
  User.find_by_index('$bucket','_').each {|u| u.destroy! }
end
