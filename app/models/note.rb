class Note < ActiveRecord::Base
  has_one :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
end
