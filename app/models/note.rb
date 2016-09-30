class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, -> {distinct},  through: :viewers, source: :user

  def visible_to=(list)
    list.split(",").each do |name|
      readers << User.find_or_create_by(name: name.strip)
    end
  end

  def visible_to
    @names = readers.collect {|reader| reader.name}
    @names.join(", ")
  end     

end
