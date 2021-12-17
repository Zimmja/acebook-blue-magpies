RSpec.feature "", type: :feature do
    before(:each) do
      sign_up
      visit "/posts"
      new_post("Hello World!", "New post", true)
    end

    scenario "can comment on post" do
      expect(page).to have_content 'Hello World!'
      expect(page).to have_button 'Create Comment'
    end

    scenario "comments show below a post" do
      new_comment("What a lovely post! :)")
      expect(page).to have_content 'What a lovely post! :)'
    end
  end