class ShowController < ApplicationController
  before_action :set_post, only: [:show, :notify_user]

  # GET /show/:id
  def show
    # Display post details
  end

  # POST /notify_user/:id
  def notify_user
    @post = Post.find(params[:id])
    latitude = params[:latitude]
    longitude = params[:longitude]
    UserMailer.notify_post_owner(@post, latitude, longitude).deliver_now

    flash[:notice] = "User has been notified, thank you!"

    redirect_to post_path(@post)
  end
  
  private

  def set_post
    @post = Post.find(params[:id])
  end
end
