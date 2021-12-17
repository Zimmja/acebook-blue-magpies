require 'rails_helper'

RSpec.feature "", type: :feature do
  before(:each) do
    sign_up
    user = User.first
    visit "/users/#{user.id}"
  end

  scenario "Users can create new posts on their walls" do
    expect(page).to have_content 'Post to your wall'
    new_post("Post 1", "Post to your wall")
    expect(page).to have_content 'Post 1'
  end
end