class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new

    can :manage, Note, {user_id: user.id}
    # can :create, Note
    # can :update, Note do |note|
    #   note.user_id == user.id
    # end

    can :read, Note do |note|
       note.readers.include?(user) || note.user_id == user.id
    end
  end
end
