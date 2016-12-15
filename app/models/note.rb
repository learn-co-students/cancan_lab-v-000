class Note < ActiveRecord::Base

  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  belongs_to :user

end
