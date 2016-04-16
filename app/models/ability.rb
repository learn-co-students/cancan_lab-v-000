class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Note do |note|
      user.readable.include?(note)
    end

    can :update, Note, user: user
    can :create, Note, user: user
  end

end
