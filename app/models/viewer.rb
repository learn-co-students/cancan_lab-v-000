class Viewer < ActiveRecord::Base
	belongs_to :readable, class_name: 'Note'
	belongs_to :reader, class_name: 'User'
end
