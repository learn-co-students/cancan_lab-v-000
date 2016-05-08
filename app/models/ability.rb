class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Note do |note|
      note.user_id == user.id
    end
    can :update, Note do |note|
      note.user_id == user.id
    end
    can :read, Note do |note|
      note.readers.include? user
    end
  end
end


# Ability                                                                         
#   users                                                                         
#     can :read their own posts (FAILED - 4)                                      
#     can't :read posts they're not viewers of (FAILED - 5)                       
#     can :read posts they're viewers of (FAILED - 6)                             
#     can :update their own notes (FAILED - 7)                                    
#     can't :update any other user's notes     
