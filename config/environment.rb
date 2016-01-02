ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])


ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/development.db")

$: << '.'
# Dir["app/models/*.rb"].each {|f| require f}
# Dir["app/controllers/*.rb"].each {|f| require f}
# Dir["app/controllers/*/*.rb"].each {|f| require f}



require_all 'app'
# require_all 'lib'
# set :database, {adapter: "sqlite3", database: "../db/database.db"}
