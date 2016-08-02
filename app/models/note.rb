class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user



  def visible_to=(users)
    new_users = users.split(", ")
    new_users.each do |user|
      self.readers << User.find_by(name: user)
    end
    self.readers = self.readers.uniq
  end

  
  def visible_to
    @readers = self.readers
    if @readers.count > 0
    @readers.map(&:name).join(", ")
    else
      ""
    end
  end



  #accepts_nested_attributes_for :visible_to, :reject_if => :all_blank



end
