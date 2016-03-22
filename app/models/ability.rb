class Ability
  include CanCan::Ability

  def initialize(user)

    unless user.nil?
        can :create, Note
    end

    if user
        can :read, Note do |note|
            note.visible_to.include?(user.name)
        end

        can :manage, Note do |note|
            note.user == user
        end
    end
  end
end
