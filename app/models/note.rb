class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  after_create :ensure_owner_can_read


  def visible_to=(reader_list)
    reader_list.split(", ").each do |r|
      user = User.find_by(name: r)
      viewer = Viewer.create(user: user, note: self) if user
    end
  end

  def visible_to
    self.readers.map {|r| r.name }.join(", ")
  end

  private

  def ensure_owner_can_read
    Viewer.create(user: self.user, note: self)
  end

end
