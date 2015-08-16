namespace :config do
  task :set_paths do
    SSHKit.config.command_map[:bower] = File.join(release_path, 'node_modules', 'bower', 'bin', 'bower')
    SSHKit.config.command_map[:grunt] = File.join(release_path, 'node_modules', 'grunt-cli', 'bin', 'grunt')
    SSHKit.config.command_map[:forever] = File.join(release_path, 'node_modules', 'forever', 'bin', 'forever')
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

namespace :npm do
  task :install do
    on roles(:app) do
      within release_path do
        execute :npm, "install"
      end
    end
  end
end

namespace :bower do
  task :install do
    on roles(:app) do
      within release_path do
        execute :bower, "install"
      end
    end
  end
end

namespace :grunt do
  task :build do
    on roles(:app) do
      within release_path do
        execute :grunt, "build"
      end
    end
  end
end

namespace :deploy do
  task :start do
    invoke 'config:set_paths'
    on roles(:app) do
      within release_path do
        execute :forever, "start #{fetch(:forever_script, "./config/forever.json")} #{fetch(:forever_options, ["-l logs/forever.log", "-o logs/stdout.log", "-e logs/stderr.log", "--spinSleepTime 10000", "--minUptime 1000"]).join(" ")}"
      end
    end
  end
  task :stop do
    invoke 'config:set_paths'
    on roles(:app) do
      within release_path do
        execute :forever, "stop #{fetch(:forever_script, "./config/forever.json")} #{fetch(:forever_options, ["-l logs/forever.log", "-o logs/stdout.log", "-e logs/stderr.log", "--spinSleepTime 10000", "--minUptime 1000"]).join(" ")}"
      end
    end
  end
  task :restart do
    invoke 'config:set_paths'
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        execute :forever, "restart #{fetch(:forever_script, "./config/forever.json")} #{fetch(:forever_options, ["-l logs/forever.log", "-o logs/stdout.log", "-e logs/stderr.log", "--spinSleepTime 10000", "--minUptime 1000"]).join(" ")}"
      end
    end
  end
end