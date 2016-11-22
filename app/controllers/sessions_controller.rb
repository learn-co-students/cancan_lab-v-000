class SessionsController < ApplicationController
  def create
    if params[:user_id].nil? || params[:user_id].empty?
      render notes_new_path
    else
      session[:user_id] = params[:user_id]
      render notes_new_path
    end
  end
end
