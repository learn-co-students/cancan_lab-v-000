class User < ActiveRecord::Base
  has_many :notes
  has_many :viewers
  has_many :readers, :through => :viewers, :source => :notes

  
end
