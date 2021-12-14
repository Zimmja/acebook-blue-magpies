require 'rails_helper'

RSpec.feature "", type: :feature do
  before(:each) do
    sign_up
    user = User.first
    visit "/users/#{user.id}"
  end

  scenario "Users can create new posts on their walls" do
    expect(page).to have_content 'New post'
    new_post("Post 1")
    expect(page).to have_content 'Post 1'
  end
end