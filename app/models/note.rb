class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user
  before_save :check_owner

  def visible_to
    readers.map {|reader| reader.name}.join(', ')
  end

  def visible_to=(list)
    self.readers = list.split(',').map do |name|
      User.find_by(name: name.strip)
    end
  end

  private

  def check_owner
    if user && !readers.include?(user)
      readers << user
    end
  end
end
