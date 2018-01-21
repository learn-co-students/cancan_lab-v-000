class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  after_create :ensure_owner_can_read

  def visible_to
    self.readers.map {|reader| reader.name}.join(", ")
  end
  
  def visible_to=(names)
    names.split(", ").each do |name|
      user = User.find_by(name: name)
      viewer = Viewer.create(user: user, note: self) if user
    end
  end

  private

  def ensure_owner_can_read
    Viewer.create(user: self.user, note: self)
  end
end
