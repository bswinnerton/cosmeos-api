APP_ENV = ENV.fetch('RACK_ENV') { 'development' }.to_sym
APP_ROOT = File.expand_path('..', File.dirname(__FILE__))

require 'bundler'
Bundler.require(:default, APP_ENV)

LOAD_PATHS = ['app', 'lib', 'config/initializers']
LOAD_PATHS.each do |load_path|
  Dir["#{load_path}/**/*.rb"].each { |path| require File.join(APP_ROOT, path) }
end
