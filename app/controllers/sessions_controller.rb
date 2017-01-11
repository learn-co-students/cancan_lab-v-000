class SessionsController < ApplicationController

  def create
    binding.pry
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
