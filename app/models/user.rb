class User < ActiveRecord::Base
  has_many :viewers
  has_many :notes
  has_many :readable, through: :viewers, source: :note
end
