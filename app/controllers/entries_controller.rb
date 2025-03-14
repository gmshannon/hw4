class EntriesController < ApplicationController
  before_action :require_login

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user_id = session[:user_id] # Associate entry with the logged-in user

    if @entry.save
      redirect_to place_path(@entry.place_id), notice: "Entry created successfully!"
    else
      render :new
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on, :place_id, :image)
  end
end

