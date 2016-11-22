class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user

  accepts_nested_attributes_for :user

  def visible_to
    readers.collect  { |reader| reader.name }.join(", ")
  end

  def visible_to=(users)
    users.split(",").each do |user_name|
      readers << User.find_or_create_by(name: user_name.strip)
    end
  end
end
