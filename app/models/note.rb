class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to
    self.viewers
  end

  def visible_to=(name)
    if !name.empty?
      name = name.split.each do |name|
        @user = self.readers.build(name: name)
        @user.save

      end
      #byebug
    end
  end

end
