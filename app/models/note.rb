class Note < ActiveRecord::Base

  belongs_to :user

  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :owner_can_read


  def visible_to
    readers.map { |u| u.name }.join(', ')
  end

  def visible_to=(new_readers)
    self.readers = new_readers.split(',').map do |name|
      User.find_by(name: name.strip)
    end.compact
  end

  def owner_can_read
    self.readers << user if user && !readers.include?(user)
  end


end

#
# readers => viewers
# readables => notes
# +
#
#
# Youtube_author has many viewers
#                 has many videos
#                 has many :subscribed, source: viewers, through: :youtube_video
#                 has many viewers of the video
#
# youtube_videos bleongs to a youtube author
#               has many viewers
#               has many :subscribers, source: viewers, through: :youtube_author
#               has_many viewers of the author
#
#
# person has_many parents, source: person
#        has_many grandparents, source: parents, through: :person
#        has_many grandparents of the parents
