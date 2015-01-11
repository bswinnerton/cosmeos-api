APP_ENV = ENV.fetch('RACK_ENV') { 'development' }.to_sym
APP_ROOT = File.expand_path('..', File.dirname(__FILE__))

require 'bundler'
Bundler.require(:default, APP_ENV)

Dir['lib/*.rb'].each { |path| require File.join(APP_ROOT, path) }
Dir['config/initializers/*.rb'].each { |path| require File.join(APP_ROOT, path) }
