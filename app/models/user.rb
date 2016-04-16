class User < ActiveRecord::Base
  has_many :viewers
  has_many :readable, through: :viewers, source: :note


  def self.find_by_names names_list
    names = names_list.gsub /\s+/, ''
    User.where name: names.split(',')
  end

end
