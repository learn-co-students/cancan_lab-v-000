class Ability < ActiveRecord::Base
  include CanCan::Ability

  def initialize(user)
    if user

      can :read, Note do |note|
        note.readers.include?(user)
      end

      can :manage, Note, user_id: user.id
    end
  end
end
