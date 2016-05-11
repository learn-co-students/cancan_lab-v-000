class Note < ActiveRecord::Base
	belongs_to :user
	has_many :viewers
	has_many :readers, through: :viewers, source: :user

	def visible_to=(names)
		if names.include?(',')
			names = names.split(', ') 
			names.each do |name|
				@user = User.find_by(:name => name)
				self.readers << @user
			end

		else
			self.readers << User.find_by(:name => names) unless names == ''
		end
	end

	def visible_to
		names = ''
		self.readers.each do |reader|
			@user = reader.name
			names << "#{@user}, "
		end
		names.chop!.chop! if names != ''
	end

	
end
