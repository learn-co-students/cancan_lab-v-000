class Viewer < ActiveRecord::Base
  belongs_to :note
  belongs_to :user

  validates_uniqueness_of :user_id, scope: [:note_id]
end
