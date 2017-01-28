class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can [:read, :update], Note do |note|
      note.user == user
    end
    
    can :read, Note do |note|
      user.readables.include? note
    end
    
  end
end
