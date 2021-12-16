require 'rails_helper'

RSpec.feature "Logging in", type: :feature do
  scenario "User can log in with correct details" do
    sign_up
    expect(current_path).not_to eq "/login"
  end

  scenario "User can't log in with incorrect details'" do
    visit '/login'
    fill_in "email", with: "abcdefg"
    fill_in "password", with: "hijklmnop"
    click_button "Log In"
    expect(current_path).to eq "/login"
  end
end