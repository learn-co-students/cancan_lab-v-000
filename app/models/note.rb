class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :make_sure_owner_can_read

  def visible_to=(list)
   self.readers = list.split(',').collect { |name| User.find_by(name: name.strip) }.compact
  end

  def visible_to
   self.readers.collect{ |reader| reader.name }.join(', ')
  end

  private
    def make_sure_owner_can_read
     if user && !readers.include?(user)
       readers << user
     end
    end
end
