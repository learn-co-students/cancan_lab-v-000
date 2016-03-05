class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user

  # accepts_nested_attributes_for :viewers
  ##### is the above correct? #######
  def visible_to
    array = []
    array << self.readers
    array << self.user
    array.compact.flatten.map {|user| user.name}.join(", ")
  end

  def visible_to=(arg)
    arg.split(",").each do |name|
      name.strip!
      user = User.find_by(name: name)
      user.readable << self
    end
  end
end
