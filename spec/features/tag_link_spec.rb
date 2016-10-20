require 'spec_helper'
require './models/link'
require 'database_cleaner'
require 'web_helpers'

RSpec.feature "tag link", :type => :feature do

  scenario "tagging links" do
    visit '/new'
    create_link
    click_button "Create link"
    expect(page).to have_text "news"
  end
end
