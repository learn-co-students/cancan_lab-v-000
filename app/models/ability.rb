class Ability
  include CanCan::Ability

  def initialize(user)
    #can :read, Note, :user_id => user.id
    #can :update, Note, :user_id => user.id
    #can :read, Note, :viewers => {:user_id => user.id}

    can :manage, Note, {user_id: user.id}

    can :read, Note do |note|
      note.readers.include? user
    end
  end
end