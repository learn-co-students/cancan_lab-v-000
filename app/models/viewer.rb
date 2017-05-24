class Viewer < ActiveRecord::Base
  belongs_to :note
  belongs_to :user
  #has_many :readers, through: :viewers, source: :user
end
