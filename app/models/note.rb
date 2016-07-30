class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  #accepts_nested_attributes_for :readers

  def visible_to
  	permitted_readers = self.readers.collect { |r| r.name }
  	permitted_readers.join(", ")
  end

  def visible_to=(list)
  	if list != nil
  		permitted_readers = list.split(/\s*,\s*/)
  		permitted_readers.each do |reader|
  			user = User.find_or_create_by(:name => reader)
        if !self.readers.include? user 
          self.readers << user 
        end
  		end
  	end
  end
end
