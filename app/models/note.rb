class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  accepts_nested_attributes_for :viewers



  def visible_to=(names)
    n = names.split(',')
    self.readers.clear
    n.each do |name|
      name.strip!
      user = User.find_or_create_by(name: name)
      self.readers << user unless self.readers.include?(user)
    end
  end

  def visible_to
    names = self.viewers.collect {|v| v.user.name}
    n = names.join(', ')
    return n
  end


end
