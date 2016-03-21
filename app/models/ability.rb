class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Note, user: user   
    can :read, Note do |note|
        user.readable.include?(note)
    end
  end
end


