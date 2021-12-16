require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:each) do
    User.create({:name => "test_name", :email => "test@email.com", :password => "hellohello", :image => fixture_file_upload("Acebook_Profile.png")})
    session[:user_id] = User.last.id
  end
  describe "GET /new " do
    it 'testing image' do
      expect(User.count).to eq (1)
    end
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    before(:each) do
      User.create({:name => "Matt", :email => "hello@world.com", :password => "abcde123"})
      @new_id = User.last.id
    end

    it "responds with 200" do
      post :create, params: { post: { message: "Hello, world!", images: "", user_id: @new_id, loc_id: @new_id } }
      expect(response).to redirect_to(User.find(@new_id))
    end

    it "creates a post" do
      post :create, params: { post: { message: "Hello, world!", images: "", user_id: @new_id, loc_id: @new_id } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
