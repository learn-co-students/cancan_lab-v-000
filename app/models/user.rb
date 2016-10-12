class User < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :note 
end
