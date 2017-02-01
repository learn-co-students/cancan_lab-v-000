class User < ActiveRecord::Base
  # validates :name, uniqueness: true

  has_many :notes
  has_many :viewers
  has_many :readable, through: :viewers, source: :note
end
