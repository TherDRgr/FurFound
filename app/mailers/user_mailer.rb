class UserMailer < ApplicationMailer
    default from: 'no-reply@stockxchange.com' # Set a default sender email address
  
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
  end
  