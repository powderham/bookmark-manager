require "spec_helper"
require "database_cleaner"
require "./models/link"
require "./models/tag"

RSpec.feature "view tags", :type => :feature do
  scenario "Filter links by tag" do
    visit '/new'
    create_link
    click_button "Create link"
    fill_in :tag_filter, with: "news"
    expect(page).to have_text "news"
  end
end
