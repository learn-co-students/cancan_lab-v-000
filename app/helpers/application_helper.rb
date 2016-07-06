module ApplicationHelper
  def log_in_form
    if current_user
      link_to "Log out", session_path(session), method: :delete
    else
      render partial: '/sessions/form' unless current_user
    end
  end    
end
