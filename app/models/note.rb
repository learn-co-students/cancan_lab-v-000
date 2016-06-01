class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  before_save :check_owner_can_read

  def visible_to
    self.readers.map { |reader| reader.name }.join(", ")
  end

  def visible_to=(readers_list)
    readers_list.split(", ").each do |reader|
      self.readers << User.find_by_name(reader)
    end
  end

  private
    def check_owner_can_read
      if user && !readers.include?(user)
        readers << user
      end
    end
end
