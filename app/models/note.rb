class Note < ActiveRecord::Base
	has_many :viewers
	has_many :readers, through: :viewers, source: :user

	accepts_nested_attributes_for :readers

	def visible_to
		notes.user
	end

	def visible_to=(users)
		if !users.blank?
			users.each do |user|
				notes.user << user
			end
		end
	end
end
