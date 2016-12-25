class User < ActiveRecord::Base
  has_many :viewers
  has_many :notes, through: :viewers
end
