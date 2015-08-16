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
set :linked_dirs, %w{node_module app/bower_components}
after "deploy:updated", "nodejs:build"

## Contributing

1. Fork it ( https://github.com/[my-github-username]/Capistrano-NodeJS/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
