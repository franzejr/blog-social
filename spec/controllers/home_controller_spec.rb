require 'spec_helper'

describe HomeController do 

	describe "GET user" do
		it "Should show a user " do 
			user = mock_model(User)
			User.stub(:find_by_id).and_return user 
		end
	end

	describe "GET users" do
		it "Should show all users" do 
			
		end
	end


	describe "GET follow" do
		it "Should show a user " do 
			
		end
	end

	describe "GET unfollow" do
		it "Should show a user " do 
			
		end
	end
end