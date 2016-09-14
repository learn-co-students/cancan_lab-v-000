class Note < ActiveRecord::Base

  belongs_to :user
  #SELECT  "users".*
  #FROM "users"
  #WHERE "users"."id" = ?
  #LIMIT 1

  has_many :viewers
  #SELECT "viewers".*
  #FROM "viewers"
  #WHERE "viewers"."note_id" = ?

  has_many :readers, through: :viewers, source: :user
  #SELECT "users".*
  #FROM "users"
  #INNER JOIN "viewers"
  #ON "users"."id" = "viewers"."user_id"
  #WHERE "viewers"."note_id" = ?

  before_save do
    readers << user if user && !readers.include?(user)
  end

  def visible_to=(reader_attributes)
     self.readers = reader_attributes.split(',').map do |name|
       User.find_or_create_by(name: name.squish)
     end.compact
   end

  def visible_to
    readers.map do |user|
      user.name
    end.join(', ')
  end

end
