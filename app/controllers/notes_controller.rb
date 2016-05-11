require 'pry'

class NotesController < ApplicationController


	def new
		@note = Note.new
	end

	def create
		@note = Note.create(content: params[:note][:content], visible_to: params[:note][:visible_to])
		@note.user_id = current_user.id if current_user
		authorize! :create, @note
		@note.readers << current_user
		redirect_to '/'
	end

	def show
		@note = Note.find(params[:id])
		authorize! :read, @note
	end

	def edit
		@note = Note.find(params[:id])
	end

	def update
		@note.update(content: params[:note][:content], visible_to: params[:note][:visible_to])
		authorize! :update, @note
		redirect_to '/'
	end

	def delete
	end
end
