# config valid for current version and patch releases of Capistrano
lock "3.4.0"

set :application, "i2iApi"
set :repo_url, "https://github.com/Vizzuality/i2i-api.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"
set :deploy_to, '/var/www/i2i-api'

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"
set :linked_files, %w{.env}

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"
# set :linked_dirs, %w{node_modules}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 2

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

# RVM
# set :rvm_ruby_version, '2.2.1'
set :rvm_custom_path, '/usr/share/rvm'

# PM2
set :pm2_app_command, 'ecosystem.config.js'
set :pm2_app_name, 'i2iapi'
set :pm2_start_params, '--env production'

# Yarn
# set :yarn_target_path, -> { release_path.join('subdir') } # default not set
set :yarn_flags, '--silent --no-progress'
# set :yarn_roles, :all                                     # default
set :yarn_env_variables, { 'NODE_OPTIONS': '--max-old-space-size=2048' }

namespace :deploy do
  after 'deploy:published', 'nginx:restart'
end