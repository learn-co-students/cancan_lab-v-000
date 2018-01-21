class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user

  #reader  [user.name 'mimis' ' migas' ' ralphy']
  def visible_to
    users = readers.collect do |user|
      user.name
    end
    users.join(', ')
  end

  "migas, mimis, ralphy"

  #writer
  def visible_to=(string)   "['mimis' ' migas' ' ralphy']"
    self.readers = string.split(',').collect do |name|
      User.find_or_create_by(name: name.strip)
    end

  end
end
