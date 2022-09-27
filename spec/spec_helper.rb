# frozen_string_literal: true

if RUBY_ENGINE == 'ruby'
  require 'simplecov'
  SimpleCov.start
end

# Set up Rails cache for testing
require 'rails'
Rails.cache = ActiveSupport::Cache.lookup_store(:memory_store)


require File.expand_path('../../lib/checkr_web_service', __FILE__)

require 'rspec'
require 'pry'
require 'dotenv'
Dotenv.load('.env.test')


RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

CheckrWebService.configure do |config|
  config.client_id = ENV['SANDBOX_CHECKR_CLIENT_ID']
  config.client_secret = ENV['SANDBOX_CHECKR_CLIENT_SECRET']
  config.public_key = ENV['SANDBOX_CHECKR_PUBLIC_KEY']
end
