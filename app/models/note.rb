class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, -> { order 'name' }, through: :viewers, source: :user

  def visible_to
     readers.pluck(:name).join(', ') if save
  end

  def visible_to=(username_list)
    list = username_list.split(', ')
    list.each do |username|
     readers << User.find_by(name: username) if User.find_by(name: username)
   end
  end

end
