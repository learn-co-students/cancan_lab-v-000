class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :add_owner_to_readers

  def visible_to=(user_list)
    users = user_list.gsub(/\s+/, "").split(',').each do |user|
      self.readers << User.find_by(:name => user)
    end
  end

  def visible_to
    readers.map(&:name).join(', ')
  end

  private

    def add_owner_to_readers
      if user && !readers.include?(user)
        readers << user
      end
    end
end
