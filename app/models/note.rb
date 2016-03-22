class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  before_save :assign_self_as_reader

  validates_presence_of :content

  def assign_self_as_reader
    self.readers << self.user if !readers.include?(self.user)
  end

  def visible_to
    readers.collect{|r| r.name}.join(", ")
  end

  def visible_to=(names)
    viewer_names = names.split(/[^\w]/).reject(&:empty?)

    self.readers = viewer_names.collect do |name|
      User.find_by(name: name)
    end
  end
end
