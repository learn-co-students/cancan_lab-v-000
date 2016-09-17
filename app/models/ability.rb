class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.nil?
      user ||= User.new # guest user (not logged in)

      can :read, Note do |note|
        note.readers.include?(user)
      end

      can :manage , Note do |note|
       note.user_id == user.id
      end
  
  end
end
