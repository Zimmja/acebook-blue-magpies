require 'rails_helper'

RSpec.feature "", type: :feature do
  scenario "Post has its own page" do
    sign_up
    visit "/posts"
    new_post("Post 1", "New post", true)
    expect(page.status_code).to eq 200
    expect(page).to have_content 'Post 1'
  end
end






  
