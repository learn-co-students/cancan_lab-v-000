class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user
      # A hash of conditions can be passed to further restrict which
      # records this permission applies to.
      can :manage, Note, {user_id: user.id}
      can :read, Note do |note|
        note.readers.include? user
      end
    end
  end
end
