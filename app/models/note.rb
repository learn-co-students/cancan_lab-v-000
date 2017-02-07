class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to
    self.viewers
  end

  def visible_to=(name)
    if !name.empty?
      name.split.each do |name|
        self.readers << User.find_by(name: name)
      end
    end
  end

end
