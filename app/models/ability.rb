class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Note do |note|
      note.user_id == user.id.to_s
    end
    can :read, Note do |note|
      note.readers.include?(user)
    end
    unless user.nil?
      can :create, Note
      can :update, Note do |note|
        note.user_id == user.id.to_s
      end
    end
  end
end
