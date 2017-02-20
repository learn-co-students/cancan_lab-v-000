class Ability
  include CanCan::Ability

  def initialize(user)
  	can :read, Note do |note|
  		note.readers.include?(user) || note.user == user
  	end
  	can :update, Note do |note|
  		note.user == user
  	end
  end

end