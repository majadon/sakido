require 'bundler/capistrano' #use bundler

set :rvm_type, :system
#set :rvm_ruby_string, ENV['GEM_HOME'].gsub(/.*\//,"")

ssh_options[:keys] = %w('~/.ssh/id_rsa.pub')
set :application, "ragnarok"
set :repository,  "https://github.com/majadon/sakido.git"
set :local_repository,  'C:\Sites\ragnarok'
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "/home/sakido/public_html/#{application}/"
set :use_sudo, false
set :branch, 'master'
set :scm_verbose, true

server "majadon.com", :app, :web, :db, :primary => true, :port => 42, :user => "sakido"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"
=begin
namespace :deploy do
  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      from = source.next_revision(current_revision)
      if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
      else
        logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
    end
  end
end
=end

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :db do
  desc "Touch database configuration file. Be sure to take a look at it!"
  task :setup, :except => { :no_release => true } do
    run "mkdir -p #{shared_path}/config"
    run "touch #{shared_path}/config/database.yml"
  end
  
  desc "Generate symlink for database configuration file" 
  task :symlink, :except => { :no_release => true } do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml" 
  end
end

#namespace :attachments do
#  desc "Create attachments upload folder."
#  task :setup, :except => { :no_release => true } do
#    run "mkdir -p #{shared_path}/public/uploads"
#  end
#  desc "Generate symlink for attachemnts" 
#  task :symlink, :except => { :no_release => true } do
#    run "ln -nfs #{shared_path}/public/uploads #{release_path}/public/uploads" 
#  end
#end


after "deploy:finalize_update", "db:symlink"
#after "deploy:finalize_update", "attachments:setup"
#after "deploy:finalize_update", "attachments:symlink"
after "deploy", "deploy:migrate"
after "deploy:setup", "db:setup"