class Ability
  include CanCan::Ability

  def initialize(user)
  	
  	# guests
  	return unless user

  	# a user can do the full CRUD on a note he owns
  	can :manage, Note, {user_id: user.id}

  	# a user can only read a note if its name is whitelisted on the Note's readers list
  	can :read, Note do |note|
  		note.readers.include?(user)
  	end

  end
end
