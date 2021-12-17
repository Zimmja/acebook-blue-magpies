def new_post(message, button = "New post", then_click = false)
  click_link button
  fill_in "Message", with: message
  click_button "Create a Post"
  first(:link, message).click if then_click
end
