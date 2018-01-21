class Note < ActiveRecord::Base
	belongs_to :user
	has_many :viewers
	
	has_many :readers, through: :viewers, source: :user

	before_save :ensure_owner_can_read


	# readers and writers to create the relationship between a note and its viewers
	def visible_to
		readers.map(&:name).join(', ')
	end

	def visible_to=(new_readers)
		self.readers = new_readers.split(',').map{ |name| User.find_by(name: name.strip) }.compact
	end

	private

	def ensure_owner_can_read
		readers << user if user && !readers.include?(user)
	end
end
