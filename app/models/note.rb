class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user
  before_save :make_owner_readable

  def visible_to
      self.readers.map(&:name).join(", ")
  end

  def visible_to=(users)
    new_users = users.split(/,\s+/)
    self.readers = new_users.map { |name| User.where('name = ?', name).first or User.create(name: name)}
  end


  def make_owner_readable
    if user && !readers.include?(user)
      readers << user
    end
  end



end
