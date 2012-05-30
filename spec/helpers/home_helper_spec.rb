require 'spec_helper'

describe HomeHelper do
	
	describe "follow or unfollow" do
		it "Should show a link to to follow person" do
			user = mock_model(User)
			current_user = mock_model(User)

			should_receive(:current_user).and_return current_user

			current_user.stub(:following?).and_return false
			link = follow_or_unfollow user
			link.should == link_to("Follow", follow_url(user),:class=>"btn btn-success")
		end

		it "Should show a link to to unfollow person" do
			user = mock_model(User)
			current_user = mock_model(User)

			should_receive(:current_user).and_return current_user

			current_user.stub(:following?).and_return true
			link = follow_or_unfollow user
			link.should == link_to("Unfollow", unfollow_url(user),:class=>"btn btn-danger")
		end
		
	end

end