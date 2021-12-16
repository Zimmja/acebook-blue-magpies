def sign_up(then_login = true, details = {:name => "Rudolph", :email => "rudolph@christmas.com", :password => "shinynose12"})
  visit "/"
  click_link "Sign up"
  expect(current_path).to eq "/users/new"
  fill_in "Name", with: details[:name]
  fill_in "Email", with: details[:email]
  fill_in "Password", with: details[:password]
  attach_file("Image", "spec/fixtures/files/Acebook_Profile.png")
  click_button "Sign up!"
  log_in if then_login
  expect(current_path).not_to eq "/login"
end