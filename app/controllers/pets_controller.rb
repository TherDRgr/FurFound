class PetsController < ApplicationController
  before_action :authenticate_user! # Ensure user is logged in before creating a pet
  before_action :set_pet, only: %i[show edit update destroy]

  # GET /pets or /pets.json
  def index
    @pets = Pet.all
  end

  # GET /pets/1 or /pets/1.json
  def show
  end

  # GET /pets/new
  def new
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit
  end

  # POST /pets or /pets.json
  def create
    @pet = current_user.pets.build(pet_params)
    if @pet.save
      redirect_to @pet, notice: 'Pet was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pets/1 or /pets/1.json
  def update
    if @pet.update(pet_params)
      redirect_to @pet, notice: 'Pet was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pets/1 or /pets/1.json
  def destroy
    @pet.destroy!

    respond_to do |format|
      format.html { redirect_to pets_url, notice: "Pet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def report_missing
    @pet = Pet.find(params[:id])

    # Use the user's address if available, otherwise use a placeholder
    last_seen_location = current_user.home_address.presence || "Update Address"

    @post = Post.new(
      name: @pet.name,
      color: @pet.color,
      species: @pet.species,
      breed: @pet.breed,
      last_seen_location: last_seen_location,
      date_reported: Date.today, # Use current date
      user: current_user, # Associate with current user
      photo: @pet.photo # Use the pet's photo
    )

    if @post.save
      redirect_to @post, notice: 'The pet has been reported missing and a post has been created.'
    else
      redirect_to pet_path(@pet), alert: 'There was an issue reporting the pet as missing.'
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pet_params
      params.require(:pet).permit(:name, :color, :breed, :species, :user_id, :photo)
    end
end
