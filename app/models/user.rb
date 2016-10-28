class User < ActiveRecord::Base
	has_many :notes
	has_many :viewers, foreign_key: 'reader_id'
	# has_many :readables, through: :viewers, foreign_key: :readable_id, class_name: :note
	has_many :readables, class_name: 'Note', through: :viewers, foreign_key: 'reader_id'
end
