class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to
  end

  def visible_to=(user_list)
    binding.pry
  end

end
