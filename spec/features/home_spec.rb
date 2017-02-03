require 'rails_helper'

RSpec.describe "Home", type: :feature do
  scenario "have navbar element" do
    visit root_path
    expect(page).to have_css "nav.navbar"
  end
end
