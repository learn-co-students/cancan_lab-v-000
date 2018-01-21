class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :permit

  def visible_to=(readers_list)
    readers_list.split(", ").each do |reader|
      user = User.find_by(name: reader)
      self.readers << user
    end
  end

  def visible_to
    names = self.readers.collect{|reader| reader.name}
    names.join(", ")
  end

  private

    def permit
      if user && !readers.include?(user)
        readers << user
      end
    end
end
