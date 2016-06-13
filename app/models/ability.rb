class Ability
  include CanCan::Ability

  def initialize(user)
    # binding.pry
    unless user.nil?
      can :manage, Note, {user_id: user.id}
    
      can :read, Note do |note|
        note.readers.include? user
      end
    end
  end  
end
