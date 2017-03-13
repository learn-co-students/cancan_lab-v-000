class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    can :read, Note do |note|
      note.user == user || note.readers.include?(user)
    end

    can [:create, :update], Note, user_id: user.id

  end
end
