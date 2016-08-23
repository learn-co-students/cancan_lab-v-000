class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Note do |note|
        note.readers.include?(user)
    end
    unless user.nil?
        can :manage, Note, {user_id: user.id}
    end
  
    end
end
