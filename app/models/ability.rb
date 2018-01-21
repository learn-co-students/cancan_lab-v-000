class Ability
  include CanCan::Ability

  def initialize(user)
    can [:create], Note if user
    can :manage, :all, {user_id: user.id} if user
    can :read, Note do |note|
        note.readers.include?(user)
    end
  end
end
