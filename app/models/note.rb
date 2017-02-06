class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to
    self.viewers
  end

  def visible_to=(name)
    if !name.empty?
      name.map do |name|
        @reader = self.readers.find_or_create_by(name: name)
      end
    end
  end

end
