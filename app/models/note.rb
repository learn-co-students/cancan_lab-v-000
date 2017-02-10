class Note < ActiveRecord::Base
  has_many :viewers
  belongs_to :user
  has_many :readers, through: :viewers, source: :user

  accepts_nested_attributes_for :viewers
  def visible_to=(username_csv)
    if !username_csv.blank?
      usernames = username_csv.split(",")
      usernames.each do |name|
        self.readers << User.find_or_create_by(name: name.strip)
      end
    end
  end

  def visible_to
    self.readers.map {|x| x.name }.join(", ") || nil
  end
end
