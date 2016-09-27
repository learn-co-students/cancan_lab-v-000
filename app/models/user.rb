class User < ActiveRecord::Base
  has_many :notes
  has_many :viewers
  has_many :readable, through: :viewers, source: :note

  # def initialize
  #   user = User.new
  # end
  # ROLES = {0 => :admin, 1 => :moderator, 2 => :user, 3 => :guest}
  #
  # attr_reader :role
  #
  # def initialize(role)
  #   @role = ROLES.has_key?(role.id.to_i) ? ROLES[role.id.to_i] : ROLES[3]
  # end
  #
  # def role?(role_name)
  #   role == role_name
  # end

end
