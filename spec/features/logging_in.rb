def log_in
  visit '/login'
  # expect(User.count).to eq (1)
  # expect(User.find_by(email: "rudolph@christmas.com").id).not_to be nil
  fill_in "email", with: "rudolph@christmas.com"
  fill_in "password", with: "shinynose12"
  click_button "Log In"
  expect(current_path).not_to eq "/login"
end