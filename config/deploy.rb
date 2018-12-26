set :application, 'representaciones'
set :repo_url, 'git@github.com:bluelemons/representaciones.git'

append :linked_files, 'config/database.yml', 'Passengerfile.json'
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", 'vendor/bundle'

namespace :deploy do
  desc "Restart server"
  task :restart do
    on roles(:app) do |host|
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :'deploy:restart'

  desc "Read revision log"
  task :logs do
    on release_roles(:all) do
      within releases_path do
        execute "cat #{ revision_log }"
      end
    end
  end

end
