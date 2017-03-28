class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  before_save :add_user_to_reader

  #def visible_to
  #   visible_to = self.readers.map {|r| r.name}
  #   visible_to.join(", ")
  #end

#  def visible_to=(readers)
#    readers.split(",").map(&:strip).each do |r|
#      user = User.find_by(name: r)
      #Viewer.create(note_id: self.id, user_id: user.id)
#      self.readers << user
#    end
#  end

def visible_to
   readers.map { |u| u.name }.join(', ')
 end

 def visible_to=(new_readers)
   self.readers = new_readers.split(',').map do |name|
     User.find_by(name: name.strip)
   end.compact
 end
end

def add_user_to_reader
  self.readers << self.user
end
