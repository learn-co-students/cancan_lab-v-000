class Note < ActiveRecord::Base
	belongs_to :user
	has_many :viewers, foreign_key: 'readable_id'
	# has_many :readers, through: :viewers, foreign_key: :reader_id, class_name: :user
	has_many :readers, class_name: 'User', through: :viewers, foreign_key: 'readable_id'

	def visible_to=(name_list)
		name_list.split(", ").collect{ |name| User.find_or_create_by(name: name) }.each{ |user| self.readers << user }
		self.save
	end

	def visible_to
		self.readers.collect{ |reader| reader.name }.join(", ")
	end
end
