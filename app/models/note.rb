class Note < ActiveRecord::Base
	belongs_to :user
	has_many :viewers
	has_many :readers, through: :viewers, source: :user

	accepts_nested_attributes_for :readers

	def visible_to=(readers_list)
		if !readers_list.empty?
			readers_array = readers_list.split(', ').reject {|name| name.empty?}
			readers_array.each do |reader|
				user = User.find_by(:name => reader)
				self.readers << user
			end
		end
	end

	def visible_to
		names = self.readers.collect{|reader| reader.name}
		names.join(", ")
	end
end
