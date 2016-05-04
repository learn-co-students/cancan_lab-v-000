class User < ActiveRecord::Base
  has_many :viewers
  has_many :notes, through: :viewers
  has_many :readable, through: :viewers, source: :note
end
