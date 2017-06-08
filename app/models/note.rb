class Note < ActiveRecord::Base
	belongs_to :user
	has_many :viewers
	has_many :readers, through: :viewers, source: :user

	before_save :ensure_user_is_reader

	def visible_to=(readers_addition)
		new_readers = readers_addition.split(', ').collect{|reader_name|
			User.find_by(name: reader_name.strip)
		}.compact

		self.readers = new_readers
		self.save
	end

	def visible_to
		readers.collect {|reader| reader.name}.join(', ')
	end

	private

	def ensure_user_is_reader
		if self.user && readers.exclude?(self.user)
			readers << user
		end
	end

end
