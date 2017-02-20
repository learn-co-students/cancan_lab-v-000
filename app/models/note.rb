class Note < ActiveRecord::Base
	has_many :viewers
	has_many :readers, through: :viewers, source: :user
	belongs_to :user
	before_save :check_owner_is_reader

	def visible_to=(list)
    list.gsub(/\s+/,'').split(',').each do |item|
    	self.readers << User.find_by(name: item)
    end
	end

	def visible_to
		self.readers.map {|reader| reader.name}.join(', ')
	end

	private

	  def check_owner_is_reader
	  	if user && !readers.include?(user)
	  		readers << user
	  	end
	  end
end
