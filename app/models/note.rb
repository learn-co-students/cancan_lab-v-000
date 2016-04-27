class Note < ActiveRecord::Base
	belongs_to :user
	has_many :viewers
	has_many :readers, through: :viewers, source: :user
	
	def visible_to=(str)
		str.split(", ").each do |u|
			self.readers << User.new(name: u)
		end
	end
	
	def visible_to
		self.readers.map(&:name).join(", ")
	end
end
