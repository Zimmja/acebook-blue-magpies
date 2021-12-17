require 'rails_helper'

RSpec.feature "Sign up", type: :feature do
  before(:each) do
    visit "/"
    click_link "Sign up"
  end

  let (:error_pw_blank) { "Password can't be blank" }
  let (:error_pw_short) { "Password is too short (minimum is 8 characters)" }
  let (:error_pw_long) { "Password is too long (maximum is 20 characters)" }
  let (:error_em_inv) { "Email is invalid" }
  let (:error_name) { "Name can't be blank" }

  scenario "The sign-up page has a title and information-entry fields" do
    page_should_have_content(["Sign up", "Name", "Email", "Password"])
  end

  scenario "If no fields are filled out, displays the appropriate error messages" do
    click_button "Sign up!"
    page_should_have_content([error_name, error_em_inv, error_pw_blank])
  end

  scenario "Password can't be too long or too short" do
    test_field("Password", "abcdefghijklmnopqrstuvwxyz", error_pw_long)
    test_field("Password", "hi", error_pw_short)
    test_field("Password", "hellothere", error_pw_short, false)
  end

  scenario "Email must be correctly formatted" do
    test_field("Email", "higmail.com", error_em_inv)
    test_field("Email", "hi@gmail.com", error_em_inv, false)
  end

  scenario "Creates a new user and returns to welcome page if all details are valid" do
    fill_in "Name", with: "Rudolph"
    fill_in "Email", with: "rudolph@christmas.com"
    fill_in "Password", with: "shinynose12"
    attach_file("Image", "spec/fixtures/files/Acebook_Profile.png")
    expect { click_button "Sign up!" }.to change { User.count }.by(1)
  end

  def test_field(field, with_text, expectation = null, expected = true)
    fill_in field, with: with_text
    click_button "Sign up!"
    expect(page.has_content?(expectation)).to eq expected
  end

  def page_should_have_content(contents)
    contents.each {|cont| expect(page).to have_content(cont)}
  end
end