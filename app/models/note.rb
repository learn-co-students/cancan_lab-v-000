class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  #accepts_nested_attributes_for :readers

  def visible_to
    self.readers.map {|a| a.name}.join ', '
  end

  def visible_to=(readers_string)
    names = readers_string.gsub(/\s+/,'').split(/,/)

    #if editing
    self.readers.delete_all

    #add readers
    if names.any?
      names.each do |name|
        if user = User.find_by(name: name)
          self.readers << user unless self.readers.include?(user)
        end
      end
    end

    #add creator as reader
    self.readers << self.user unless self.readers.include?(self.user) || self.user == nil
  end
end
