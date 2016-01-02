require_relative './config/environment'

# if ActiveRecord::Migrator.needs_migration?
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end

use Rack::MethodOverride
use ApplicationController

map "/bars" do
  run BarsController
end

map "/patrons" do
  run PatronsController
end

map "/reviews" do
  run ReviewsController
end
