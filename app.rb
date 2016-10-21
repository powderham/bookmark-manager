ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/data_mapper_setup'

configure

class BookmarkManager < Sinatra::Base

  get '/' do
    @links = Link.all
    erb :links
  end

  get '/new' do
    erb :new_links
  end

  post '/' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(tag_name: params[:tag])
    link.tags << tag
    link.save
    redirect to('/')
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
