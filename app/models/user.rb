class User < ActiveRecord::Base
  has_many :notes
  has_many :viewers
  has_many :readble, through: :viewers, source: :note
end
