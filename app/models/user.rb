class User < ActiveRecord::Base
	has_many :viewers
	has_many :notes
	has_many :readable, through: :viewers, source: :note

	accepts_nested_attributes_for :readable
end
