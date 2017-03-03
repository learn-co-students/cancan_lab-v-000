class User < ActiveRecord::Base
  # belongs_to :note
  has_many :viewers
  has_many :readable, through: :viewers, source: :note
end
