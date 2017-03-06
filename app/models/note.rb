class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :add_user_to_readers

  def visible_to
    self.save
    readers.pluck(:name).join(', ')
  end

  def visible_to=(user_name_list)
    unless user_name_list.empty?
      readers.clear
      user_list = user_name_list.split(', ')
      user_list.each do |user_name|
        user = User.find_by(name: user_name)
        readers << user
      end
    end
  end

  private

    def add_user_to_readers
      if user && !readers.include?(user)
        readers << user
      end
    end
end
