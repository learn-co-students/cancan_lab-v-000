class User < ActiveRecord::Base
    has_many :notes
    has_many :viewers
    has_many :readables, :through => :viewers, :source => :note
end
