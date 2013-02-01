module UsersHelper

	# Returns the Gravatar (http://gravatar.com) for the given user
	def gravatar_for(user, options = { size: 50 })
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=mm"
		gravatar_profile_url = "http://gravatar.com/#{gravatar_id}"
		image_tag(gravatar_url, alt: user.username, class: "gravatar")
	end
	
end
