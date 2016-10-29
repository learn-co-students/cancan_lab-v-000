class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user



  def visible_to
  end

  def visible_to=
  end

end
