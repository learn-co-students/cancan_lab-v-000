require 'pry' 
class Ability
    include CanCan::Ability

    def initialize(user)

        user ||= User.new # guest user (not logged in)

        alias_action :show, :update, :destroy, :to => :ud
        
        can :ud, Note do |note|
#            binding.pry
            note.user_id == user.id
        end
        
        can :read, Note do |note|
#            binding.pry
            note.readers.include?(user) || note.user == user
        end 

    end
end
