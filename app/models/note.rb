class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  accepts_nested_attributes_for :readers

  def visible_to=(name_list)
    name_array = name_list.split(", ")
    name_array.each do |username|
      self.readers << User.find_by(name: username)
    end
  end

  def visible_to
    names = []
    self.readers.each { |user| names << user.name }
    names.sort!
    names.join(", ")
  end

end
