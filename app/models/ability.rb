class Ability
  include CanCan::Ability

  def initialize(user)
    # Guests cannot do anything
    return unless user

    # Note creators can do everything to their notes
    can :manage, Note, {user_id: user.id}

    can :read, Note do |note|
      note.readers.include? user
    end
  end
end
