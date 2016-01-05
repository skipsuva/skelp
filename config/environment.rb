# ENV['SINATRA_ENV'] ||= "development"
#
# require 'bundler/setup'
# Bundler.require(:default, :development, :production)
#
# configure :production, :development do
#   db =  URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/db/development')
#
#   ActiveRecord::Base.establish_connection(
#     :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
#     :host     => db.host,
#     :username => db.user,
#     :password => db.password,
#     :database => db.path[1..-1],
#     :encoding => 'utf8'
#
#   )
# end

configure :development do
 set :database, 'sqlite:///dev.db'
 set :show_exceptions, true
end

configure :production do
 db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/mydb')

 ActiveRecord::Base.establish_connection(
   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
   :host     => db.host,
   :username => db.user,
   :password => db.password,
   :database => db.path[1..-1],
   :encoding => 'utf8'
 )
end





# ActiveRecord::Base.establish_connection(
#   adapter: "sqlite3",
#   database: "db/development.db")

$: << '.'


require_all 'app'
