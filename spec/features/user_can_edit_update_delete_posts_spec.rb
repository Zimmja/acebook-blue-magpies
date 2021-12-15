require 'rails_helper'

RSpec.feature "Modifying posts", type: :feature do
  before(:each) do
    sign_up
    visit "/posts"
    @post_text = "Hello, world!"
    new_post(@post_text)
    click_link @post_text
  end

  scenario "User can edit posts" do
    click_button "Edit Post"
    edit_text = "Goodbye, world!"
    fill_in "Message", with: edit_text
    click_button "Update the Post"
    expect(page).to have_content(edit_text)
  end

  scenario "User can delete posts" do
    click_button "Delete Post"
    visit "/posts"
    expect(page).not_to have_content(@post_text)
  end
end