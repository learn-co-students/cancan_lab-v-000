class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  before_save :authorize_reader

  def visible_to=(new_readers)
    self.readers = new_readers.split(', ').map do |name|
      User.find_by(name: name)
    end
  end

  def visible_to
    self.readers.map { |user| user.name  }.join(', ')
  end

  private

  def authorize_reader
    if user && !readers.include?(user)
      readers << user
    end
  end
end
