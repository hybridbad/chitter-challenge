require 'sinatra/base'
require './app/lib/peep'
require './app/lib/database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/create-peep' do
    Peep.create(peep: params[:peep])

    redirect '/'
  end

  run! if app_file == $0

end