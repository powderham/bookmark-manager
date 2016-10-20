def create_link
  fill_in :title, with: 'BBC'
  fill_in :url, with: 'https://www.bbc.co.uk/'
  fill_in :tag, with: 'news'
end
