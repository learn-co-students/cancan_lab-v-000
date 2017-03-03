require 'pry'

class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  # accepts_nested_attributes_for :note

  def visible_to=(comma_separated_list)
    names = comma_separated_list.split(', ')
    found_users = names.each.map do |n|
      User.find_by(name: n)
    end
    found_users.each do |fu|
      self.readers << fu unless self.readers.include? fu
    end
    sorted_readers = self.readers.sort{ |a, b| a.id <=> b.id }
    self.readers.clear
    self.readers = sorted_readers
    # The sorting above is silliness to satisfy a spec that requires that the readers appear in a particular order
    self.save
  end

  def visible_to
    self.readers.map do |r|
      r.name
    end.join(", ")
  end

end
