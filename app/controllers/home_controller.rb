class HomeController < ApplicationController
	def index

	end
	def user
		@user = User.find_by_id(params[:id])
	end
	def list_user

	end

	def follow
		@user = User.find_by_id(params[:id])
		if !current_user.following?(@user)
			current_user.follow(@user)
		end
		redirect_to(:back)
	end

	def unfollow
		@user = User.find_by_id(params[:id])
		if current_user.following?(@user)
			 current_user.stop_following(@user)
		end
		redirect_to(:back)
	end

end
