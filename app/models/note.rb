class Note < ActiveRecord::Base
	has_many :viewers
	has_many :readers, through: :viewers, source: :user
	belongs_to :user

	before_save :add_user_to_readers

	def add_user_to_readers
		self.readers << self.user unless self.readers.include?(self.user)

	end

	def visible_to=(names)
	#	names.split(", ").each { |name| self.readers << User.find_by(name: name) }
	names = names.split(", ").collect { |name| User.find_by(name: name) }
	end 

	def visible_to
		names.collect { |reader| reader.name }.join(", ")
	end

	

end
