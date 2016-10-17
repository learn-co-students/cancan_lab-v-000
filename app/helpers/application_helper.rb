module ApplicationHelper

  def sign_out
    button_to "sign out", logout_path, method: delete
  end
end
