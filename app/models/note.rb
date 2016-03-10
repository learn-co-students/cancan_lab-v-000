class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user


  #think about using the join table here instead?
  def visible_to=(csl)
    if csl.include?(',')
      csl.split(', ').each do |name|
        self.readers << User.find_by(name: name)
        binding.pry
      end
    elsif csl != ""
      self.readers << User.find_by(name: csl)
    end
  end

  def visible_to
    arr = []
    self.readers.each do |reader|
      arr << reader.name
    end
    arr.join(', ')
  end

end
