class ChangePasswordController < ApplicationController
def change
  @password = params[:password]
  @password_confirmation = params[:password_confirmation]
  @old_password = params[:old_password]
  @user = User.find_by_Username (params[:Username])
  if @user
    if @old_password = @user.Password
      if @password = @password_confirmation
        @user.update_attributes(Password: @password)
        flash.alert = "Password has been updated"
      else
        flash.alert = "Invalid Password Confirmation"
      end
    else
      flash.alert = "Invalid Username or Old Password"
    end
  else
    flash.alert = "Invalid Username or Old Password"
  end
end
def user_params
  params.require(:user, :old_password).permit(:password, :password_confirmation)
end
end
