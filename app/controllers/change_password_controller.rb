class ChangePasswordController < ApplicationController
def change
  @old_password = params[:Password]
  @password = params[:password]
  @password_confirmation = params[:password_confirmation]
  @user = User.find_by_Username(params[:Username])
    if  usercheck
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
      flash.alert = "Invalid Username"
    end
end
def user_params
  params.require(:user, :old_password).permit(:password, :password_confirmation)
end
end

def usercheck
  user = User.find_by_Username(params[:Username])
  password = User.find_by_hashedpassword (params[:Password])
  if user || password
    return true
  else
    nil
  end
end
