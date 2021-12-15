require 'rails_helper'

RSpec.feature "Logging in", type: :feature do
  scenario "User can log in with correct details" do
    sign_up
    expect(current_path).not_to eq "/login"
  end

  scenario "User can't log in with incorrect details'" do
    sign_up(true, {:name => "none", :email => "none", :password => "none"})
    expect(current_path).to eq "/login"
  end
end