def create_link
  visit '/new'
  fill_in :title, with: 'BBC'
  fill_in :url, with: 'https://www.bbc.co.uk/'
  fill_in :tag, with: 'news radio'
  click_button "Create link"
end
