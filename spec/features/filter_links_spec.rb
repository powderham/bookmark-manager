require "spec_helper"
require "database_cleaner"
require "./models/link"
require "./models/tag"

RSpec.feature "view tags", :type => :feature do
  scenario "Filter links by tag" do
    create_link
    expect(page).to have_text "news"
  end
end
