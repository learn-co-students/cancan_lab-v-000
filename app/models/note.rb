class Note < ActiveRecord::Base
    belongs_to :user
    has_many :viewers
    has_many :readers, through: :viewers, source: :user

    before_save :can_owner_read?

    def visible_to=(user)
       users = user.split(",")
       users.collect do |u| 
         normalized_user = u.strip
         readers << User.find_by(name: normalized_user)
        end
    end 

    def visible_to
       readers.collect {|reader| reader.name}.join(", ")
    end 

    private 

    def can_owner_read?
      if user && !readers.include?(user)
        readers << user
      end
    end
    
end
