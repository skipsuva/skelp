# ENV['SINATRA_ENV'] ||= "development"
#
require 'bundler/setup'
Bundler.require(:default, :development, :production)

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


configure :production, :development do
 db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/mydb')

 ActiveRecord::Base.establish_connection(
   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
   :host     => db.host,
   :username => db.user,
   :password => db.password,
   :database => db.path[1..-1],
   :encoding => 'UTF8'
 )
end



$: << '.'


require_all 'app'
