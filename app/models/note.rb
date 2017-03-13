class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to
    readers.pluck(:name).join(', ') if save
  end

  def visible_to=(names)
    users = names.split(', ')
    users.each do |user|
      if reader = User.find_by(name: user)
        readers << reader
      end
    end
  end
end
