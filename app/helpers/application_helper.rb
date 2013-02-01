module ApplicationHelper

	#Returns the full title on a per-page basis.
	def full_title(page_title)
		base_title = "sakido.net"
		if page_title.empty?
			base_title
		else
			"#{page_title} | #{base_title}"
		end
	end

	def human_delay_time(delay)
		delay = delay.to_i/1000/60
		if delay.zero?
			"instant"
		else
			 pluralize delay, "Minute"
		end
	end

end
