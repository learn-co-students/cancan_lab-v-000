class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to=(name)
    user = User.find_by(name: name)
    self.viewers.create(user: user)
  end
end
