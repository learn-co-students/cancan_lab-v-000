class Ability
  include CanCan::Ability

  def initialize(user)
    can [:read, :update], Note do |note|
      note.user == user
    end

    can :read, Note do |note|
      note.readers.include? user
    end
  end
end
