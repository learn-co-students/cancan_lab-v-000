class Ability
  include CanCan::Ability
  def initialize(user)
    can :manage, Note, user_id: user.id  # manage our notes
    can :read, Note do |note|  # read only if reading another note
      note.readers.include?(user)
    end
  end
end
