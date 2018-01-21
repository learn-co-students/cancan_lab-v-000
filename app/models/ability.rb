class Ability
  include CanCan::Ability


  def initialize(user)
    
    unless user.nil?
        can :create, Note
        # can :update, Note do |n|
        #     n.user_id == user.id
        # end
    end 

    can :read, Note do |note|
        note.user == user || note.readers.include?(user)
    end

    can :update, Note do |note|
        note.user == user
    end
  end
end
