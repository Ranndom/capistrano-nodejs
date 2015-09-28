# Capistrano::NodeJS

Capistrano plugin to install NPM and Bower dependencies and run Grunt tasks for deployment.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'Capistrano-NodeJS'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install Capistrano-NodeJS

## Usage

```ruby
# Capfile
require 'capistrano/nodejs'
```

```ruby
# config/deploy.rb

# Only required if you don't want to download dependencies on every deploy, rather than updating the previous deploy.
set :linked_dirs, %w(node_modules app/bower_components)

set :npm_target, -> { release_path.join('npm_dir') } # Defaults to not set.
set :bower_target, -> { release_path.join('bower_dir') } # Defaults to not set.
set :grunt_target, -> { release_path.join('grunt_dir') } # Defaults to not set.

set :npm_role, :all # Defaults to :all
set :bower_role, :all # Defaults to :all
set :grunt_role, :all # Defaults to :all

set :npm_args, %w(--production --silent) # Defaults to '--production' & '--silent'.
set :bower_args, %w(--silent) # Defaults to '--silent'.
set :grunt_args, %w() # Defaults to none.
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/Capistrano-NodeJS/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
