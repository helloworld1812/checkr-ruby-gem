# frozen_string_literal: true

source 'https://rubygems.org'

gem 'rake', '~> 13.0', '>= 13.0.1'

group :development do
  gem 'awesome_print', require: 'ap'
end

group :test do
  gem 'json', '>= 2.3.0', platforms: [:jruby]
  gem 'mime-types', '~> 3.3', '>= 3.3.1'
  gem 'multi_json', '~> 1.14', '>= 1.14.1'
  gem 'rspec', '~> 3.9'
  gem 'simplecov', require: false
  gem 'vcr', '~> 6.1'
  gem 'webmock', '~> 3.8', '>= 3.8.2'
end

faraday_version = ENV.fetch('FARADAY_VERSION', '~> 2.0')

gem 'faraday', faraday_version

if faraday_version.start_with?('~> 2')
  gem 'faraday-multipart'
  gem 'faraday-retry'
end

group :test, :development do
  gem 'pry-byebug'
  gem 'redcarpet'
  gem 'rubocop', '1.36.0'
end

gemspec
