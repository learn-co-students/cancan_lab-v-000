class Note < ActiveRecord::Base
	has_many :viewers
	belongs_to :user
	has_many :readers, through: :viewers, source: :user
	
	def visible_to=(names)
		array = names.gsub(/ /,"").split(",")
		array.each do |name|
			self.readers << User.find_or_create_by(name: name)
		end
	end
	
	def visible_to
		arr = []
		self.readers.each do |read|
		arr << read.name
		end
		arr.join(", ")
	end
end
