class Note < ActiveRecord::Base
	has_many :viewers
	has_many :readers, through: :viewers, source: :user
	belongs_to :user

	before_save :user_can_read

	def user_can_read
		self.readers << self.user if self.user && !self.readers.include?(self.user)
	end

	def visible_to
		list = readers.collect do |reader|
			reader.name
		end
		list.join(', ')
	end

	def visible_to=(name_string)
		user_names = name_string.split(', ')

		user_names.each do |user_name|
			unless user_name == "" || user_name.nil?
				new_user = User.find_or_create_by(name: user_name)
				self.readers << new_user
			end
		end
	end
end
