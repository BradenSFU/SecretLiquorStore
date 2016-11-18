class ChangePasswordController < ApplicationController
def change
  @username = params[:username]
  @old_password = params[:old_password]
  @password = params[:password]
  @password_confirmation = params[:password_confirmation]
  @user = current_user
  flash.alert = @user.Username,2,@old_password
    if User.authenticate(@user.Username, @old_password)
      if @password == @password_confirmation
        if @password.length <= 5
          flash.alert = "Password should not be empty"
        else
          @user.update_attributes(Password: @password)
          flash.alert = "Password has been updated"
        end
      else
        flash.alert = "Invalid Password Confirmation"
      end
    else
      flash.alert = "Invalid Old Password"
    end
end
def user_params
  params.require(:username, :old_password).permit(:password, :password_confirmation)
end
end
