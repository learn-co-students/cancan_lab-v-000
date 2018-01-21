class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Note, user_id: user.id  #CRUD on own notes
    can :read, Note do |note|  #read only if a "reader" of a note
      note.readers.include?(user)
    end
    
  end
end
