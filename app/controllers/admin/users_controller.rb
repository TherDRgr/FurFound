class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_user, only: [:edit, :update, :destroy, :approve]

  def index
    @users = User.where.not(role: 'admin')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = Devise.friendly_token.first(8) # or set a default password
    if @user.save
      UserMailer.pending_signup_email(@user).deliver_now
      redirect_to admin_users_path, notice: 'User was successfully created and notified.'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: 'User was successfully deleted.'
  end

  def approve
    @user = User.find(params[:id])
    @user.update(approved: true)
    
    UserMailer.approval_email(@user).deliver_now

    redirect_to admin_users_path, notice: 'User was successfully approved.'
  end

  def profile
    @user = current_user
  end
  
  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :role, :approved)
  end

  def check_admin
    redirect_to root_path, alert: 'You are not authorized to access this page.' unless current_user.admin?
  end
end
