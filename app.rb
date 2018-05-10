require 'sinatra/base'
require './lib/stored_bookmarks'
require 'sinatra/flash'

class Bookmarks < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @bookmark = StoredBookmarks.all
    erb :index
  end

  post '/form' do
    flash[:error] = "Invalid url"
    flash[:error] unless StoredBookmarks.add(params[:bookmark])
    redirect('/')
  end

end
