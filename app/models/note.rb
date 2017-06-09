class Note < ActiveRecord::Base

    has_many :viewers
    has_many :readers, through: :viewers, source: :user

    belongs_to :user

    def visible_to
        readers.collect {|user| user.name }.join(", ")
    end

    def visible_to=(users)
        self.readers = users.split(",").collect do |user_name|
            User.find_or_create_by(name: user_name.strip)
        end
        return self.readers
    end

end
