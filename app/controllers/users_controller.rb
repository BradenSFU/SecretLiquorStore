class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :check_admin, only: :index
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    if current_user
      redirect_to root_url
      return
    end
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    #redirect_to edit_user_path(current_user) if @user.id != current_user.id
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.Isadmin = false if @user.Isadmin == ''
    if @user.save
      if @user.Isadmin
        redirect_to users_url
      else
        redirect_to just_logged_in_url, :notice => "Signed up!"
      end
      session[:user_id] = @user.id
    else
      render "new"
    end
  end
=begin
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
=end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if current_user.id == @user.id
      @user.destroy
      respond_to do |format|
        format.html { redirect_to log_out_path, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:Username, :Password, :Password_confirmation, :Email, :Biography, :Isadmin)
    end



    def check_admin
      redirect_to(root_url) unless current_user && current_user.Isadmin?
    end
end
