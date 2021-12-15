def sign_up_multiple(then_login = true)
  sign_up(false)
  click_link "Log out"
  sign_up(false, {:name => "Simon", :email => "simon@test.com", :password => "shinynose12"})
  click_link "Log out"
  sign_up(true, {:name => "Jacob", :email => "jacob@test.com", :password => "shinynose12"})
end