class User < ActiveRecord::Base
	has_many :notes
	has_many :viewers
    has_many :readable, through: :viewers, source: :note



end


#Log in  User
	# if they are logged in, and they are listed as a viewer or are the author of a note, they can see the note
	# if they are not logged in, they can't see the note
	# if they are logged in but not listed as a viewer on the note, they can't view the note
	