class Ability
  include CanCan::Ability

  def initialize(user)

    # can :update their own notes
    can :manage, Note, {user_id: user.id}

    # can :read posts they're viewers of
    # can :read their own posts
    can :read, Note do |note|
      note.readers.include? user
    end
  end
end
