require 'pry'

class SessionsController < ApplicationController

  def create
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
