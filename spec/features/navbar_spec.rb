RSpec.feature "", type: :feature do
  before(:each) do
    visit "/"
  end

  scenario "navbar has log in and sign up links when not logged in" do
    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Sign up'
  end

  scenario "navbar has posts, profile and logout links when logged in" do
    sign_up
    log_in
    expect(page).to have_content 'Posts'
    expect(page).to have_content 'Profile'
    expect(page).to have_content 'Log out'
  end

  scenario "navbar links takes user to appropriate page when not logged in" do
    check_link_path("Log in", '/login')
    check_link_path("Sign up", '/users/new')
  end

  scenario "navbar links takes user to appropriate page when logged in" do
    sign_up
    log_in
    check_link_path("Posts", '/posts')
  end

  scenario "navbar Profile link goes to logged-in user's profile" do
    sign_up
    user = User.first
    check_link_path("Profile", "/users/#{user.id}")
    expect(page).to have_content "Your wall"
  end

  def check_link_path(link, path)
    click_link link
    expect(current_path).to eq path
  end
end