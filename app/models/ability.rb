class Ability
  include CanCan::Ability
  def initialize(user)
    # Guests can't do anything.
    return unless user
    can :manage, Note, {user_id: user.id}
    can :read, Note do |note|
      note.readers.include? user
    end
  end
end
