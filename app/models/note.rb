class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :read_own_notes

  def visible_to
    readers.map {|user| user.name}.join(', ')
  end

  def visible_to=(new_readers)
    self.readers = new_readers.split(', ').map do |name|
      User.find_by(name: name.strip)
    end
  end


private

  def read_own_notes
      if user && !readers.include?(user)
        readers << user
      end
  end


end
