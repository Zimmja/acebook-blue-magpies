require 'rails_helper'

RSpec.feature "Posts can be liked", type: :feature do
  before(:each) do
    sign_up
    visit "/posts"
    new_post("Post 1", true)
  end

  scenario "User can click button to like a post" do
    expect(page).to have_content 'React'
  end

  scenario "Amount of likes for a post are displayed" do  # I have not found correct syntax to select from drop down menu to correct error
    5.times {select 'Like'}
    expect(page).to have_content '5'
  end
end
