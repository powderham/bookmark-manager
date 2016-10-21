def create_link
  visit '/new'
  fill_in :title, with: 'BBC'
  fill_in :url, with: 'https://www.bbc.co.uk/'
  fill_in :tag, with: 'news radio'
  click_button "Create link"
end

def new_user
  visit '/'
  fill_in :email, with: 'ed@gmail.com'
  fill_in :password, with: 'cool'
  click_button "Sign up"
end
