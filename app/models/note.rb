class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  before_save :author_can_read

  def visible_to=(names_list)
    names_list.split(", ").collect {|name| readers << User.find_by(name: name)}
  end

  def visible_to
    readers.collect{|r| r.name}.join(", ")
  end

  private

  def author_can_read
    if !readers.include?(user)
      readers << user
    end
  end
end
