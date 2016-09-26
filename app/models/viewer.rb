class Viewer < ActiveRecord::Base
  belongs_to :user
  belongs_to :note

  PERMISSIONS = { :admin => 0,
                  :user => 10,
                  :guest => 100}
end
