class UserMailer < ApplicationMailer
  default from: 'no-reply@furfound.com' # Set a default sender email address
  
    # Method to send approval email
  def approval_email(user)
    @user = user
    @url  = 'http://localhost:3000/users/sign_in' # Replace with your login URL
    mail(to: @user.email, subject: 'Your account has been approved')
  end
  
    # Method to send pending signup email
  def pending_signup_email(user)
    @user = user
    @url  = 'http://localhost:3000/users/sign_up' # Replace with your verification URL if needed
    mail(to: @user.email, subject: 'Account Signup Pending Approval')
  end

  def notify_post_owner(post, latitude, longitude)
    @post = post
    @user = post.user
    @latitude = latitude
    @longitude = longitude
  
    mail(to: @user.email, subject: 'Someone may have found your lost pet!')
  end

end
  