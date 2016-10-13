class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :give_owner_permission

  def visible_to
    self.readers.collect {|user| user.name }.join(', ')
  end

  def visible_to=(readers_list)
    # readers_list.split(',').collect do |name|
    #   self.readers << User.find_by(name: name.strip)
    # end
    self.readers = readers_list.split(',').map do |name|
      User.find_by(name: name.strip)
    end.compact
  end

  private

  def give_owner_permission
    if user && !self.readers.include?(user)
      self.readers << user
    end
  end

end
