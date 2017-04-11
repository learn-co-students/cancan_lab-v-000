require 'pry'
class Note < ActiveRecord::Base
    has_many :viewers
    has_many :readers, :through => :viewers, :source => :user

    belongs_to :user

    accepts_nested_attributes_for :readers



    def visible_to
        reader_names = self.readers.collect do |reader|
            reader.name 
        end
        reader_names.join(', ')
    end

    def visible_to=(user_names)
        user_names = user_names.split(', ')
        user_names.each do |name|
            @user = User.where(:name => name).first_or_create
            self.readers << @user
        end
        if user
            self.readers << user unless self.readers.include? (user)
        end
    end
end
