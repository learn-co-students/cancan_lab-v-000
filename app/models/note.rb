class Note < ActiveRecord::Base
	belongs_to :user
    has_many :viewers
    has_many :readers, through: :viewers, source: :user


    def visible_to=(list)
    	users = list.split(", ")

    	users.each do |user|
    		user_object = User.find_by(:name => user)
    		if user_object
    			self.readers << user_object
            end
    	end
        self.readers.sort
    end

    def visible_to
    	array = []
    	self.viewers.each do |viewer|
    		array << User.find(viewer[:user_id]).name
    	end
        array.sort!
    	array.join(", ")
    end


end
