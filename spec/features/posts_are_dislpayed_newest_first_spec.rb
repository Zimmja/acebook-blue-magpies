require 'rails_helper'

RSpec.feature "", type: :feature do
  scenario "Posts are displayed with newest first" do
    sign_up
    visit "/posts"
    new_post("Post 1")
    visit "/posts"
    new_post("Post 2")
    expect(page.body.index("Post 2")).to be < (page.body.index("Post 1"))
  end
end
