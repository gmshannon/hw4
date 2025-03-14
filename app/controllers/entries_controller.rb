class EntriesController < ApplicationController
  def create
    @entry = Entry.new(entry_params)
    @entry.place_id = params[:place_id]  # Explicitly set place_id
    @entry.user_id = session[:user_id]   # Assign the logged-in user

    if @entry.save
      redirect_to place_path(@entry.place_id), notice: "Entry created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on)
  end
end

