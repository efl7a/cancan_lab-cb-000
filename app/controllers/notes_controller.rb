class NotesController < ApplicationController
  def new

  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    if @note.save
      @note.readers << current_user
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def update
    @note = Note.find(params[:id])
    if @note.user == current_user
      @note.update(note_params)
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def delete

  end

  private

  def note_params
    params.require(:note).permit(:content, :visible_to)
  end
end
