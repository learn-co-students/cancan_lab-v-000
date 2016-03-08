class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user

  def visible_to=(args)
    args.split(', ').each do |reader|
      self.readers << User.find_by(name: reader)
    end
  end

  def visible_to
    self.readers.map { |r| r.name }.join(", ")
  end
end
