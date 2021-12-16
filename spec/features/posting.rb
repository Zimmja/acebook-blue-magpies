def new_post(message, then_click = false)
  # expect(current_path).not_to eq "/login"
  click_link "New post"
  fill_in "Message", with: message
  click_button "Create a Post"
  click_link message if then_click
end
