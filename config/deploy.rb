require 'bundler/capistrano'

# 8. Run `bin/cap deploy:setup`.
# 9. Run `bin/cap deploy:migrations` or `bin/cap deploy`.
#

set :bundle_flags, "--deployment"

set :application, "railsrumble"
set :deploy_to, "/var/www/apps/railsrumble"
set :normalize_asset_timestamps, false
set :rails_env, "production"

set :user, "root"
set :runner, "www-data"
set :admin_runner, "www-data"

set :use_sudo, false
# SCM Options
set :scm, :git
set :repository, "git@github.com:railsrumble/r12-team-241.git"
set :branch, "master"

# Roles
role :app, "69.164.207.211"

after 'deploy:update_code' do
  # Compile Assets
  run "cd #{release_path}; RAILS_ENV=production bundle exec rake assets:precompile"
end

# Restart Passenger
deploy.task :restart, :roles => :app do
  # Fix Permissions
  sudo "chown -R www-data:www-data #{current_path}"
  sudo "chown -R www-data:www-data #{latest_release}"
  sudo "chown -R www-data:www-data #{shared_path}/bundle"
  sudo "chown -R www-data:www-data #{shared_path}/log"

  # Restart Application
  run "touch #{current_path}/tmp/restart.txt"
end
