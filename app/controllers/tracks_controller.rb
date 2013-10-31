class TracksController < ApplicationController



  def index
    @tracks = Track.all
    #authorize! :read, @tracks
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
      render :new
    end
  end

  def show
    @track = Track.find(params[:id])
  end

  def edit
    @track = Track.find(params[:id])
  end

  def update
    track = Track.find(params[:id])
    track.update_attributes(params[:track])
    redirect_to(track)
  end

  def destroy
    track = Track.find(params[:id])
    track.delete
    redirect_to(tracks_path)
  end

end
