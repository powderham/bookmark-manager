class Link
  include DataMapper::Resource

  property :id, Serial
  property :link, String
  property :title, String
end
