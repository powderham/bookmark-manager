require 'spec_helper'
require './models/link'

feature 'add new links to website', :type => feature do
  scenario "adds links" do
    visit '/links'
    fill_in 'url', with: 'http://www.google.com'
    fill_in 'title', with: 'this is google'
    click_button "Submit"

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_text('this is google')
    end
  end
end
