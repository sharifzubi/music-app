class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    redirect_to current_user if current_user
    @user = User.new
  end

  # def create
  #   user = User.create(params[:user])
  #   redirect_to(user)
  # end

  def create
    @user = User.new params[:user]
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Thank you for signing up"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    @style = "body { #{params[:user][:css]}}"

    user.update_attributes(params[:user])
    redirect_to(user)
  end

  def destroy
    user = User.find(params[:id])
    user.delete
    redirect_to(users_path)
  end

end
