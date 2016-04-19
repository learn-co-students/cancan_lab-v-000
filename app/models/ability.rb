class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Note do |note|
      note.user_id == user.id || note.readers.include?(user)
    end

    can :update, Note do |note|
      note.user_id == user.id
    end
  end
end
