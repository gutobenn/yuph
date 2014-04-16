module UsersHelper
	def show_non_blank_field(label, value)
		content_tag(:p, "%s: %s" % [label, value]) unless value.blank?
	end
end