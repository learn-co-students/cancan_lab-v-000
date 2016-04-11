class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user
  # accepts_nested_attributes



  def visible_to=(visible_to)
    visible_to.split(", ").each do |u|
      self.readers << User.find_or_create_by(name: u)
    end
  end

  def visible_to
    self.readers.collect{|r| r.name}.join(", ")
  end

end
