class ChangePasswordController < ApplicationController
def change
  @old_password = params[:old_password]
  @password = params[:password]
  @password_confirmation = params[:password_confirmation]
  @user = User.find_by_Username (params[:Username])
  if @user
    if  @user.Password == @old_password
      if @password == @password_confirmation
        if @password_confirmation.blank?
          flash.alert = "Password should not be empty"
        else
          @user.update_attributes(Password: @password)
          flash.alert = "Password has been updated"
        end
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
