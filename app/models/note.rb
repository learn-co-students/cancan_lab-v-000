class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user

  before_save :add_owner_to_readers

  def visible_to=(name_list)
    self.readers = name_list.gsub(" ","").split(",").map { |name| User.find_by(name: name.downcase) }
  end

  def visible_to
    self.readers.map { |reader| reader.name}.join(", ")
  end

  private

    def add_owner_to_readers
      if user && !readers.include?(user)
       readers << user
      end
    end


end
