class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user

  accepts_nested_attributes_for :user
  ##### is the above correct? #######
  def visible_to
  end
end
