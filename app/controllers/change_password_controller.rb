class ChangePasswordController < ApplicationController
def change
  @old_password = params[:old_password]
  @password = params[:password]
  @password_confirmation = params[:password_confirmation]
  @user = User.find_by_Username(params[:Username])
    if  !User.authenticate params[:Username], params[:old_password]
      if @password.length > 5
        if @password != @password_confirmation
          flash.alert = "Invalid Password Confirmation"
        else
          @user.update_attributes(Password: @password)
          flash.alert = "Password has been updated"
        end
      else
        flash.alert = "Password is too short"
      end
    else
      flash.alert = "Invalid Username or Old Password"
    end
end
def user_params
  params.require(:user, :old_password).permit(:password, :password_confirmation)
end
end
def CreateHashedPassword
  return unless :Password.present?
  self.saltedpassword = BCrypt::Engine.generate_salt
  self.hashedpassword = BCrypt::Engine.hash_secret(:Password, saltedpassword)
end
def self.authenticate(username, password)
  user = find_by Username: username
  if user && user.hashedpassword == BCrypt::Engine.hash_secret(:Password, user.saltedpassword)  #password, user.saltedpassword)
    user
  else
    nil
  end
end
