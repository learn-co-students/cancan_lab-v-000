class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :ensure_owner_can_read

  def visible_to
		readers.collect { |u| u.name }.join(', ')
	end

	def visible_to=(new_readers)
		self.readers = new_readers.split(/\s*,\s*/).collect do |name|
			User.find_by(name: name)
		end
	end

  private

  def ensure_owner_can_read
    if user && !readers.include?(user)
      self.readers << user
    end
  end


end
