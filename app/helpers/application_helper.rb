module ApplicationHelper
	def get_gravatar(user=current_user, size=96)
               image_tag "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=#{size}"
       end
end
