require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  scenario "Can detect if logged in" do
    expect(logged_in?).not_to be
    session[:user_id] = 1
    expect(logged_in?).to be
  end

  scenario "Can retrieve user" do
    User.create({:name => "Matt", :email => "hello@world.com", :password => "abcde123"})
    expect(current_user).not_to be
    session[:user_id] = User.last.id
    expect(current_user).to be
  end
end
