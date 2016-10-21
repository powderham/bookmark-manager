require 'spec_helper'
require './models/link'
require 'database_cleaner'
require 'web_helpers'

RSpec.feature "link display", :type => :feature do
  scenario "add a user" do
    new_user
    expect(page).to have_content "Welcome, ed@gmail.com"
    expect{new_user}.to change(User, :count).by 1
  end
end
