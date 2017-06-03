class Note < ActiveRecord::Base
    belongs_to :user
    has_many :viewers
    has_many :readers, through: :viewers, source: :user
    before_save :ensure_owner_can_read

    def visible_to
        self.readers.map {|reader| reader.name}.join(', ')
    end

    def visible_to=(users)
        self.readers = users.split(',').map do |name|
            User.find_by(name: name.strip)
        end.compact
    end

    private
    def ensure_owner_can_read
        if self.user && !self.readers.include?(self.user)
            self.readers << self.user
        end
    end

end
