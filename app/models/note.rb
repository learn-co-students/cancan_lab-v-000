class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, -> { order "name asc" }, through: :viewers, source: :user



  def visible_to
    self.readers.collect{|user| user.name}.join(', ')
  end

  def visible_to=(names)
    names.split(', ').each do |name|
      user = User.find_by(name: name)
      self.readers << user
    end
  end
end
