class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_create :add_owner

  def visible_to=(users)
    names = users.gsub(/\s+/,"").split(",")
    names.each do |name|
      new_reader = User.find_by(name: name)
      new_reader ||= User.create(name: name)
      readers << new_reader
    end
  end

  def visible_to
    array = readers.collect {|reader| reader.name}
    array.join(", ")
  end

  private

  def add_owner
    readers << user if user.present?
  end
  
end
