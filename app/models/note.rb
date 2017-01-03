class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user


  def visible_to=(users)
    users.split(',').map do |name|
      user = User.find_by(name: name.strip)
      self.readers << user
    end.compact
  end

  def visible_to
  	readers.map { |reader| reader.name  }.join(', ')
  end

  
end
