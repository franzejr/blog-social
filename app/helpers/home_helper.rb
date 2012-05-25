module HomeHelper
	def follow_or_unfollow(user)
		if current_user.following?(user)
			link_to("Unfollow", unfollow_url(user),:class=>"btn btn-danger")
		else
			link_to("Follow", follow_url(user),:class=>"btn btn-success")
		end
	end
end
