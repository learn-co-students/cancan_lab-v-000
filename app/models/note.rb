class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user
  before_save :assign_owner_to_readers

  def visible_to=(names)
    self.readers = names.split(", ").map do |name|
      new_user = User.find_or_create_by(name: name)
    end
  end

  def visible_to
    self.readers.map {|reader| reader.name }.join(", ")
  end

  private

  def assign_owner_to_readers
    self.readers << user if user && !readers.include?(user)
  end
end
