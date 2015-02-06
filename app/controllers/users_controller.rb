class UsersController < ApplicationController

  def index
    @users = User.all
  end
    
  def new
    @user = User.new
  end
  
  def create
    # render plain: params[:user].inspect
    @user = User.new(user_params)
    
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
    redirect_to users_path
  end

  # Adding a new following user
  def follow
    @user = User.find(params[:user_id])
    friend = User.find(params[:friend_id])
    if !@user.blank? and !friend.blank?
      Friendship.create(:user => @user, :friend => friend)
    end
    render 'show'
  end

  # Removing following user
  def unfollow
    @user = User.find(params[:user_id])
    Friendship.where(user:   @user,
                     friend: params[:friend_id]).destroy_all
    render 'show'
  end
  
  def follower_posts
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.followings)
  end
  
  private
  def user_params
    params.require(:user).permit(:email, :nick,
                                 :password, :password_confirmation)
  end
end
