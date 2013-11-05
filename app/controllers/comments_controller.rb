class CommentsController < ApplicationController

  load_and_authorize_resource

  def index
    #@comments = Comment.all
  end

  def new
    @track = Track.find params[:track_id]
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.track_id = params[:track_id]
    @comment.user = current_user
      if @comment.save
        redirect_to @comment.track, notice: "Comment was successfully created"
      else
        flash[:alert] = "Comment was not created"
        render :new
      end
  end

  def show
    #@comment = Comment.find(params[:id])
  end

  def edit
    #@comment = Comment.find(params[:id])
  end

  def update
  #   comment = Comment.find(params[:id])
  #   comment.update_attributes(params[:comment])
  #   redirect_to(comment)
  #   # if @comment.update_attributes(params[:comment])
  #   #   redirect_to @comment
  #   # else
  #   #   flash[:alert] = "Comment was not updated"
  #   #   render :edit
  #   # end
  end

  def destroy
    comment = Comment.find(params[:comment_id])
    comment.delete
    track = comment.track
    redirect_to(track)
    # @comment.delete
    # redirect_to comments_path
  end

  def flag
    comment = Comment.find(params[:comment_id])
    comment.flagged = true
    comment.save
    flash[:notice] = "Comment was flagged!"
    redirect_to comment.track
  end

  def flagged
    @comments = Comment.where(:flagged => true).all
    render :index
  end

end
