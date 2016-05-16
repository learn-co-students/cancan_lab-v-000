class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    user ||= User.new

    #can :read, Note do |note|
        #note.user_id == user.id
    #end
    #can :update, Note do |note|
        #note.user_id == user.id
    #end
    can :manage, Note, user_id: user.id
    can :read, Note do |note|
        note.readers.include?(user)
    end

  end

end