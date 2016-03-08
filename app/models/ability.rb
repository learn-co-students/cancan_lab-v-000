class Ability
  include CanCan::Ability

  def initialize(user)
     
    
        can :create, Note, :user => user
        can :update, Note, :user => user    
        can :read, Note, :user => user    
        can :read, Note do |note|
            user.readable.include?(note)
        end
   
  end
end