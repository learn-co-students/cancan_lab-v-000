class Note < ActiveRecord::Base
	belongs_to :user
	has_many :viewers
	has_many :readers, through: :viewers, source: :user
	before_save :add_user_to_readers


	def visible_to=(users)
		self.reader_ids = users.split(",").map { |name| User.find_or_create_by(name: name.strip).id }
	# 	user_ids = []
	# 	users.split(",").each do |name|
	# 		if name.present?
	# 			user = User.find_or_create_by(name: name.strip)
	# 			user_ids << user.id
	# 		end
	# 	end
	# 	self.reader_ids = user_ids
	end

	def visible_to
		readers.collect { |r| r.name }.join(", ")
	end

	private

	def add_user_to_readers
		if user && !readers.include?(user)
			readers << user
		end
	end

end

