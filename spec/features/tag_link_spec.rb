require 'spec_helper'
require './models/link'
require 'database_cleaner'
require 'web_helpers'

RSpec.feature "tag link", :type => :feature do

  scenario "tagging links" do
    create_link
    expect(page).to have_text "news"
  end

  scenario "can add multiple tags" do
    create_link
    expect(page).to have_content "news"
    expect(page).to have_content "radio"
  end
end
