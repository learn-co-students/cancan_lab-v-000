
class Note < ActiveRecord::Base
  has_many :viewers
  belongs_to :user
  has_many :readers, through: :viewers, source: :user


  def visible_to=(comma_seporated_names_list)
    comma_seporated_names_list.split(", ").each do |name|
      self.readers << User.find_by(name: name)
    end
  end

  def visible_to
    readers.map {|reader| reader.name }.join(", ")
  end

end
