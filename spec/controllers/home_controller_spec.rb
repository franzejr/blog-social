require 'spec_helper'

describe HomeController do 

	describe "GET user" do
		it "Should show a user " do 
			user = mock_model(User)
			User.stub(:find_by_id).and_return user
			get :user , :id => user.id
			assigns[:user].should == user
		end
	end

	describe "GET users" do
		it "Should show all users" do 
			users = mock_model(User)
			User.stub(:all).and_return users
			get :users
			assigns[:users].should == users
		end
	end


	describe "GET follow" do
		login_user
		before do 
			request.env["HTTP_REFERER"] = "posts/"
		end
		it "Should show a user " do 
			user = mock_model(User)
			User.stub(:find_by_id).and_return user
			subject.current_user.stub(:following?).and_return false
			subject.current_user.should_receive(:follow).with user
			get :follow, :id => user.id
			response.should redirect_to "posts/"

		end
	end

	describe "GET unfollow" do
		login_user
		before do
			request.env["HTTP_REFERER"] = "/posts"
		end
		it "Should show a user " do
			user = mock_model(User)
			User.stub(:find_by_id).and_return user
			subject.current_user.stub(:following?).and_return true
			subject.current_user.should_receive(:stop_following).with user
			get :unfollow , :id => user.id
			response.should redirect_to "/posts"			
		end
	end
end