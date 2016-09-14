class User < ActiveRecord::Base

  has_many :notes
  #SELECT "notes".*
  #FROM "notes"
  #WHERE "notes"."user_id" = ?

  has_many :viewers
  #SELECT "viewers".*
  #FROM "viewers"
  #WHERE "viewers"."user_id" = ?

  has_many :readable, through: :viewers, source: :note
  #SELECT "notes".*
  #FROM "notes"
  #INNER JOIN "viewers"
  #ON "notes"."id" = "viewers"."note_id"
  #WHERE "viewers"."user_id" = ?

end
