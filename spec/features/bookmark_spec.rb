require 'spec_helper'
require 'link'

RSpec.feature "link display", :type => :feature do
  Link.create( id: 1, link: 'http://google.com', title: 'google')

  visit '/links'

  expect(page.status_code).to eq 200

  scenario "user is able to save a link" do
    expect(page).to have_text('http://google.com')
  end
end
