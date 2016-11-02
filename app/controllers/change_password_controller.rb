class ChangePasswordController < ApplicationController
    def change
      if user = User.find_by_Username(params[:Username])
        redirect_to root_url
      end
    end
  end
  def update
      if params[:user][:password].empty?                  # Case (3)
        @user.errors.add(:password, "can't be empty")
        render 'edit'
      elsif @user.update_attributes(user_params)          # Case (4)
        log_in @user
        flash[:success] = "Password has been reset."
        redirect_to @user
      else
        render 'edit'                                     # Case (2)
      end
    end
    def user_params
       params.require(:user).permit(:password, :password_confirmation)
     end
