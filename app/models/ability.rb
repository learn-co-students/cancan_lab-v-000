class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user
    can :read, Note do |note|
      note.readers.include?(user)
    end
    can :manage, Note, { user: user }
  end

end
