class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user


  before_save :add_owner_to_readers

  def visible_to
    readers.collect { |u| u.name }.join(', ')
  end

  def visible_to=(new_readers)
    self.readers = []
    new_readers.split(',').collect do |name|
      self.readers << User.find_by(name: name.strip)
    end.compact
  end

  private
    def add_owner_to_readers
      if user && !readers.include?(user)
        readers << user
      end
    end

end
