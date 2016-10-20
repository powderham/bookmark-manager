require 'spec_helper'
require './models/link'
require 'database_cleaner'

RSpec.feature "tag link", :type => :feature do

  scenario "tagging links" do
    # Link.create(url: 'https://www.bbc.co.uk/', title: 'BBC', tag: 'news')
    visit '/new'
    fill_in :title, with: 'BBC'
    fill_in :url, with: 'https://www.bbc.co.uk/'
    fill_in :tag, with: 'news'

    click_button "Create link"
    expect(page).to have_text "news"
  end
end
