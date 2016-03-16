class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Note do |note|
        user.readable.include?(note)
        end
    can :manage, Note, :user => user
    end
end
