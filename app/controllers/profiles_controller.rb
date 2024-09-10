class ProfilesController < ApplicationController
  before_action :authenticate_user!

  # Show user profile
  def show
    @user = current_user
  end

  # Edit user profile
  def edit
    @user = current_user
  end

  # Update user profile
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_path, notice: 'Profile updated successfully.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone_number, :home_address, :profile_picture)
  end
end
