require 'pry'
class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user
  accepts_nested_attributes_for :readers

  def visible_to=(string)
    @visible_to = string
    list = string.split(", ")
    list.each do |name|
      self.readers << User.find_or_create_by(name: name.chomp)
    end
  end

  def visible_to
    collect = self.readers.map {|r| r.name}
    collect.join(", ")
  end
end
