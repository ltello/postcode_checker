# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'
gem 'rails', '~> 6.0.3', '>= 6.0.3.1' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'

gem 'awesome_print'                            # Pretty print ruby objects.
gem 'bootsnap',     '>= 1.4.2', require: false # Reduces boot times through caching; required in config/boot.rb
gem 'interactor',   '~> 3.0'                   # Service Objects base
gem 'pg',           '>= 0.18', '< 2.0'         # Use postgresql as the database for Active Record
gem 'postcodes_io', '~> 0.3'                   # UK postcodes API client.
gem 'puma',         '~> 4.1'                   # Use Puma as the app server
gem 'turbolinks',   '~> 5'                     # Turbolinks makes navigating your web application faster.
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby] # zoneinfo files for Windows
gem 'uk_postcode',  '~> 2.1'                   # UK postcode parser
gem 'webpacker',    '~> 4.0'                   # Transpile app-like JavaScript. https://github.com/rails/webpacker
gem 'with_model',   '~> 2.1'                   # Dynamic models for testing

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw] # Debugger console
  gem 'factory_bot_rails', '~> 5.1.1'              # Factories to be used in tests
  gem 'rspec-rails',       '~> 4.0.0'              # Testing framework
end

group :test do
  gem 'capybara',                 '~> 3.32.0' # System testing
  gem 'rails-controller-testing', '~> 1.0'    # Bring assigns to tests
  gem 'shoulda-matchers', '~> 4.3.0'          # Extra Rails matchers for rspec tests
end
group :development do
  gem 'listen',      '~> 3.2'
  gem 'rubocop',     '~> 0.85'  # Ruby formatter and linter
  gem 'web-console', '>= 3.3.0' # interactive console on exception pages or calling 'console' anywhere in the code.
end
