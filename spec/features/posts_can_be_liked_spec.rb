require 'rails_helper'

RSpec.feature "Posts can be liked", type: :feature do
  before(:each) do
    sign_up
    visit "/posts"
    new_post("Post 1", "New post", true)
  end

  scenario "User can click button to like a post" do
    expect(page).to have_content 'React'
  end

  scenario "Amount of likes for a post are displayed" do  # I have not found correct syntax to select from drop down menu to correct error
    # puts "Fix text in posts_can_be_liked_spec.rb"
    3.times { apply_like }
    expect(page).to have_content '3'
  end

  def apply_like
    select "Love", :from => "like[like_option]"
    click_button "Like"
  end
end
