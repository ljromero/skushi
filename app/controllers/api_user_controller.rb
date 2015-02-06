class ApiUserController < ApplicationController

  before_action :check_devel_id, only: [:get_post, :get_following, :get_followers]

  def get_posts
    user = User.find(translate_external_user_id(params[:user_ext_id]))
    @posts = user.posts
    render json: @posts
  end

  def get_following
    user = User.find(translate_external_user_id(params[:user_ext_id]))
    @followings = user.followings
    render json: @followings
  end

  def get_followers
    user = User.find(translate_external_user_id(params[:user_ext_id]))
    @followers = user.followers
    render json: @followers
  end

  private
  # method to translate the external id to the internal one (in this
  # case, it doesn't do anything)
  def translate_external_user_id(ext_id)
    ext_id
  end

end
