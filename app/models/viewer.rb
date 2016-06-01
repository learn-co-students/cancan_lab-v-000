class Viewer < ActiveRecord::Base
  belongs_to :user
  belongs_to :note

  def visible_to

  end

  def visible_to=(readers)
    binding.pry
  end
end
