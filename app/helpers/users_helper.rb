module UsersHelper
  
  def set_user(user)
    @user ||= User.new
  end

end
