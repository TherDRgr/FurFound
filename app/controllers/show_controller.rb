class ShowController < ApplicationController
  before_action :set_post, only: [:show]

  # GET /show/:id
  def show
    # No extra logic required, just showing the post information
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
