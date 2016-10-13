class Ability
  include CanCan::Ability

  def initialize(user)
    # Guests aren't allowed to do anything so return if not user
    return unless user

    can :manage, Note, {user_id: user.id}

    can :read, Note do |note|
      note.readers.include?(user)
    end

  end
end
