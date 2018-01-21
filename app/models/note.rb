class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to=(names)
    name_array = names.gsub!(/\s+/, '').split(',')
    user_array = []
    name_array.each do |name|
      user_array << User.where(name: name)
    end
  self.readers << user_array
  end

  def visible_to
    readers.map { |u| u.name }.join(', ')
    end

end