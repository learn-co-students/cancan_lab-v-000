class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to=(names)
    self.save
    names.split(", ").each do |name|
      user = User.find_or_create_by(name: name)
      Viewer.create(user_id: user.id, note_id: self.id)
    end
  end

  def visible_to
    users = []
    # Viewer.all.where()
  end
end
