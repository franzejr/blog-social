require 'spec_helper'

describe PostController do 
  #Creating a user 
  login_user
  
  describe "GET new" do
    it "Should create a new user" do
      post = mock_model(Post)
      Post.stub(:new).and_return post
      get :new
      assigns[:post].should == post
    end
  end
  
  describe "GET show" do
    it "Should show a post" do
      post = mock_model(Post)
      Post.stub(:find_by_id).with("#{post.id}").and_return post
      get :show , :id => post.id
      assigns[:post].should == post
    end
  end
  
  describe "GET list" do
    it "Should list all posts" do
      posts = []
      Post.stub(:all).and_return posts
      get :list
      assigns[:post].should == posts
    end
  end

  describe "GET destroy"  do
    it "Should destroy a post"  
      post = mock_model(Post)
      Post.stub(:find_by_id).with("#{post.id}").and_return post
      get :destroy , :id => post.id
      assigns[:post].should == null
    end
  end
  
end