def sign_up(then_login = true, details = {:name => "Rudolph", :email => "rudolph@christmas.com", :password => "shinynose12"})
  visit "/"
  click_link "Sign up"
  fill_in "Name", with: details[:name]
  fill_in "Email", with: details[:email]
  fill_in "Password", with: details[:password]
  click_button "Enter details"
  log_in if then_login
end