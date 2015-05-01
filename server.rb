require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require './lib/link'
require './lib/tag'
require './lib/user'
require 'sinatra/partial'

require './lib/controllers/users'
require './lib/controllers/sessions'
require './lib/controllers/links'
require './lib/controllers/tags'
require './lib/controllers/application'
require './lib/helpers/application'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

DataMapper.finalize

class BookmarkManager < Sinatra::Base
  helpers ApplicationHelpers

  set :public_folder, proc {
    File.join(root, '..', '..', 'public')
  }
  set :views, proc { File.join(root, '..', 'views') }
  # set :public_folder, 'public'

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash
  use Rack::MethodOverride
  set :partial_template_engine, :erb

  run! if app_file == $0
end
