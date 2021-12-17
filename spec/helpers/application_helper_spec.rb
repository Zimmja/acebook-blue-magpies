require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  scenario "Can detect if logged in" do
    expect(logged_in?).to be
  end

  scenario "Can retrieve user" do
    User.create({:name => "Matt", :email => "hello@world.com", :password => "abcde123"})
    expect(current_user).to be User.last
  end
end
