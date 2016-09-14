class Viewer < ActiveRecord::Base
  belongs_to :user
  #SELECT  "users".*
  #FROM "users"
  #WHERE "users"."id" = ?
  #LIMIT 1

  belongs_to :note
  # SELECT  "notes".*
  # FROM "notes"
  # WHERE "notes"."id" = ?
  # LIMIT 1
  
end
