module ApplicationHelper

	def flash_message
		format_flash(:notice) if flash[:notice]
		format_flash(:alert) if flash[:alert]
	end

private

	def format_flash(type)
		content_tag :p, class: type do
			flash[type]
		end
	end

	def users_select
		User.all.collect { |user| [user.user_name, user.id] }
	end

end
