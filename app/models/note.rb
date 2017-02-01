class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :ensure_owner_can_read

  # def visible_to=(list_of_names)
  #   array_of_names = list_of_names.split(",").collect{|x| x.strip}

  #   self.readers <<  array_of_names.collect do |name|
  #     User.find_or_create_by(name: name)
  #   end
  # end

  def visible_to=(new_readers)
    self.readers = new_readers.split(',').map do |name|
      User.find_by(name: name.strip)
    end.compact
  end

  def visible_to
    self.readers.map(&:name).join(", ").strip
  end

  private
  def ensure_owner_can_read
    if user && !readers.include?(user)
      readers << user
    end
  end
end
