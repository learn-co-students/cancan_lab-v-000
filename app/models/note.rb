class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :add_owner_to_list_of_readers

  def visible_to
    self.readers
  end

  def visible_to=(input)
    if !input.empty?
      input.split(',').map{|x| x.strip}.each do |name|
        self.readers << User.find_by(name: name)
      end
    end
  end

  private

  def add_owner_to_list_of_readers
    if user && !self.readers.include?(user)
      self.readers << user
    end
  end

end
