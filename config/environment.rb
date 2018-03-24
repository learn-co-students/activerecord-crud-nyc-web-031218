require 'bundler/setup'
Bundler.require
require "pry"

db = ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

# binding.pry

require_all 'app'
