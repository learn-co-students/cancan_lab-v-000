class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :owner_permission

  def visible_to=(new_reader)
    self.readers = new_reader.split(',').map do |name|
      User.find_by(name: name.strip)
    end
  end

  def visible_to
    readers.map {|reader| reader.name}.join(', ')
  end

  private

  def owner_permission
    if user && !readers.include?(user)
      readers << user
    end
  end
end
