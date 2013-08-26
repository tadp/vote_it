module ApplicationHelper
	def fix_url(url)
  # url.starts_with?('http') ? url : "http://#{url}"
      if url.nil? || url.starts_with?('http')
        url
      else
        "http://#{url}"
    	end
  end

  def display_datetime(dt)
    dt.strftime('%B %d, %Y %l:%M%P %Z')
  end

end
