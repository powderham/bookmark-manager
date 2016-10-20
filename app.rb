require 'sinatra/base'
ENV['RACK_ENV'] ||= "development"
require_relative 'models/link'

class BookmarkManager < Sinatra::Base

  get '/' do
    @links = Link.all
    erb :links
  end

  get '/new' do
    erb :new_links
  end

  post '/' do
    Link.create(url: params[:url], title: params[:title], tag: params[:tag])
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
