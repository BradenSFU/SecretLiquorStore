class ChangePasswordController < ApplicationController
def change
  @username = params[:username]
  @old_password = params[:old_password]
  @password = params[:password]
  @password_confirmation = params[:password_confirmation]
  @user = current_user
    if User.authenticate(@user.Email, @old_password)
      if @password == @password_confirmation
        if @password.blank? || @password.length <= 5
          flash.alert = "Password should have at least 6 characters"
        else
          @user.update_attributes(Password: @password)
          redirect_to root_url, :notice => "Password has been updated!"
        end
      else
        flash.alert = "Invalid Password Confirmation"
      end
    else
      flash.alert = "Invalid Old Password"
    end
end
def reset
  @email = params[:email]
  @password = params[:password]
  @password_confirmation = params[:password_confirmation]
  @user = User.find_by Email: params[:email]
  if @user
    if @password == @password_confirmation
      if @password.blank? || @password.length <= 5
        flash.alert = "Password should have at least 6 characters"
      else
        @user.update_attributes(Password: @password)
        redirect_to root_url, :notice => "Password has been updated!"
      end
    else
      flash.alert = "Invalid Password Confirmation"
    end
  else
    flash.alert = "Invalid Email"
  end
end
def user_params
  params.require(:username, :email, :old_password).permit(:password, :password_confirmation)
end
end
