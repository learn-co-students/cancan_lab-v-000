class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Note do |note|
      note.user_id == user.id
    end

    can :read, Note do |note|
      note.readers.include? user
    end
  end
end
