class User < ActiveRecord::Base
  has_many :viewers
  has_many :readable, through: :biewers, source: :note

end
