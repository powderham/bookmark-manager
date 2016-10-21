ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/user'
require_relative 'models/data_mapper_setup'
require 'bcrypt'

configure

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/'do
    erb :index
  end

  post '/sign_up' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/links'
 end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/new' do
    erb :new_links
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    params[:tag].split.each do |tag|
    link.tags << Tag.first_or_create(tag_name: tag)
    end
    link.save
    redirect to('/links')
  end

  # https://github.com/makersacademy/course/blob/master/bookmark_manager/walkthroughs/16.md
  post "/filtered_links" do
    tag = Tag.all(conditions: {tag_name: params[:tag_filter]})
    @links = tag ? tag.links : []
    erb :links
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
