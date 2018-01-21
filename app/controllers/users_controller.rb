class UsersController < ApplicationController
  has_many :notes
  has_many :viewers
  has_many :readable, through: :viewers, source: :note
  def create
  end
end
