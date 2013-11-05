class TracksController < ApplicationController

  load_and_authorize_resource

  def index
    #@tracks = Track.all
  end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new params[:track]
    @track.user = current_user
    if @track.save
      session[:track_id] = @track.id
      redirect_to @track.user
    else
      flash[:alert] = 'Track was NOT created'
      render :new
    end
  end

  def show
    #@track = Track.find(params[:id])
  end

  def edit
    #@track = Track.find(params[:id])
  end

  def update
    track = Track.find(params[:id])
    track.update_attributes(params[:track])
    redirect_to(track, notice: "Track was successfully updated!")
  end

  def destroy
    #track = Track.find(params[:id])
    track.delete
    redirect_to(tracks_path)
  end

end
