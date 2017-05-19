require 'pry'
class Note < ActiveRecord::Base
	has_many :viewers
	has_many :readers, -> { order 'users.name' }, 
						through: :viewers, source: :user
	belongs_to :user

	def visible_to
		readers.collect { |reader|
			reader.name
			}.join(", ")
	end

	def visible_to=(names)
		names.split(/\s*,\s*/).each { |name|
			self.readers << User.find_by(name: name)
		}
	end

end
