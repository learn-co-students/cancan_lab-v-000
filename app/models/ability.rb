class Ability
  include CanCan::Ability

  def initialize(user)
    unless user.nil?
        can :update, Note, { user_id: user.id }
        can :read, Note, { user_id: user.id }
        can :create, Note
        can :destroy, Note, { user_id: user.id }

        # can use nested hashes to define associations
        # readers source is user, user does not have column 'user_id', so use 'id'

        can :read, Note, :readers => { id: user.id }
    end
  end
end
