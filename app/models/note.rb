class Note < ActiveRecord::Base
	belongs_to :user
    has_many :viewers
    has_many :readers, through: :viewers, source: :user
    before_save :add_visibility_to_user

    def visible_to
    	self.readers.map{|r|r.name}.join(", ")
    end

    def visible_to=(input)
    	users=input.split(", ").map{|i| User.find_by(name:i)}
    	self.readers = users
    end

    def add_visibility_to_user
    	
    	if self.user
    		(self.readers << self.user) if (self.readers.exclude?(self.user))
    	end
    	#byebug
    end
end
