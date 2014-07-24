module ApplicationHelper

	def flash_message
		format_flash(:notice) if flash[:notice]
	end

private

	def format_flash(type)
		content_tag :p, class: "notice" do
			flash[type]
		end
	end

end
