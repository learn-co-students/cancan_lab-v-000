class Note < ActiveRecord::Base
	belongs_to :user
	has_many :viewers
	has_many :readers, through: :viewers, source: :user
	
	before_save :do_readers
	

  def visible_to=(new_readers)
    self.readers = new_readers.split(',').map do |name|
      User.find_by(name: name.strip)
    end.compact
  end
	
	def visible_to
		self.readers.map(&:name).join(", ")
	end
	
	private 
	
		def do_readers
			if user && !readers.include?(user)
				readers << user
			end
		end
end
