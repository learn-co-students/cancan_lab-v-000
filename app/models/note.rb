class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :owner_readable #AR callback

  def visible_to=(readers) #custom setter, takes comma-separated list of names, finds users, sets them as readers
    self.readers = readers.split(",").collect do |name|
      User.find_by(name: name.strip)
    end
  end

  def visible_to #returns note's readers as a comma-separated list
    visible = self.readers.collect do |u|
      u.name
    end

    visible.join(", ")
  end

  private
  def owner_readable #ensures that creator of note is added as a reader
    if user && !readers.include?(user)
      readers << user
    end
  end
end
