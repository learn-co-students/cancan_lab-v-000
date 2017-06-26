class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  accepts_nested_attributes_for :readers

  def readers_attributes=(readers_attributes)
    names_string = readers_attributes["0"]["name"]

    names = names_string.gsub(/\s+/,'').split(/,/)

    names.each do |name|
      if user = User.find_by(name: name)
        self.readers << user
      end
    end

  end

  def visible_to
    self.readers
  end

  def visible_to=(users)
    self.readers = users
  end
end
