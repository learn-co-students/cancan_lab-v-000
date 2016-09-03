class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :include_user_to_reader

  def visible_to=(auth_user)
    auth_user.split(',').map do |name|
        self.readers << User.find_by(name: name.strip)
      end

  end

  def visible_to
    self.readers.map(&:name).join(', ')
  end
  private

  def include_user_to_reader
    if !readers.include?(user)
      readers << user
    end
  end

end
