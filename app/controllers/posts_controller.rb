require 'net/http'
require 'uri'

class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[show]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /posts or /posts.json
  def index
    @posts = Post.all.distinct
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      generate_qr_code(@post)  # Generate and store the QR code after saving the post
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
  
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@post) }
      format.html { redirect_to posts_url, notice: "Post was successfully deleted." }
    end
  end
  

  private
    # QR Code API request
    def generate_qr_code(post)
      qr_code_url = "https://api.qrserver.com/v1/create-qr-code/?data=#{ERB::Util.url_encode(show_post_url(post))}&size=150x150"
      post.update(qr_code: qr_code_url)
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:name, :color, :species, :breed, :last_seen_location, :date_reported, :photo)
    end

    def correct_user
      @post = Post.find_by(id: params[:id])
    
      # Check if the user is an admin or the owner of the post
      unless current_user.admin? || @post.user == current_user
        redirect_to posts_path, alert: "Not authorized to edit or delete this post"
      end
    end
    
end
