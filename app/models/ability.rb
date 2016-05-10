class Ability
  include CanCan::Ability

  # better:
    
    def initialize(user)
    # Guests can't do anything.
    return unless user

    can :manage, Note, {user_id: user.id}
    
    can :read, Note do |note|
      note.readers.include? user
    end
    end


  # def initialize(user)
  #   unless user.nil?
  #       can :update, Note, { user_id: user.id }
  #       can :read, Note, { user_id: user.id }
  #       can :create, Note, { user_id: user.id }
  #       can :destroy, Note, { user_id: user.id }

  #       # can use nested hashes to define associations
  #       # readers source is user, user does not have column 'user_id', so use 'id'

  #       can :read, Note, :readers => { id: user.id }
  #   end
  # end
end
