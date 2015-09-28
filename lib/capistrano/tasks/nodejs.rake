namespace :config do
  task :set_paths do
    SSHKit.config.command_map[:bower] = File.join(release_path, 'node_modules', 'bower', 'bin', 'bower')
    SSHKit.config.command_map[:grunt] = File.join(release_path, 'node_modules', 'grunt-cli', 'bin', 'grunt')
  end
end

namespace :nodejs do
  task :build do
    invoke 'config:set_paths'
    invoke 'npm:install'
    invoke 'bower:install'
    invoke 'grunt:build'
  end
end

before 'deploy:updated', 'nodejs:build'

namespace :npm do
  task :install do
    on roles(:npm_role) do
      within fetch(:npm_target, release_path) do
        execute :npm, "install", fetch(:npm_args)
      end
    end
  end
end

namespace :bower do
  task :install do
    on roles(:bower_role) do
      within fetch(:bower_target, release_path) do
        execute :bower, "install", fetch(:bower_args)
      end
    end
  end
end

namespace :grunt do
  task :build do
    on roles(:grunt_role) do
      within fetch(:grunt_target, release_path) do
        execute :grunt, "build", fetch(:grunt_args)
      end
    end
  end
end

namespace :load do
    task :defaults do
        set :npm_args, %w(--production --silent)
        set :bower_args, %w(--silent)
        set :grunt_args, %w()

        set :npm_role, :all
        set :bower_role, :all
        set :grunt_role, :all
    end
end

