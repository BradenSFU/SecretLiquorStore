class ChangePasswordController < ApplicationController
def change
  @password = params[:Password]
  @user = User.find_by_Username (params[:Username])
  if @user
    @user.update_attributes(Password: @password)
  else
    flash.now[:danger] = "Username not found"
  end
end
def user_params
  params.require(:user, :old_password).permit(:password, :password_confirmation)
end
end
