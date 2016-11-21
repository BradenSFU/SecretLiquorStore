class PublishesController < ApplicationController
  before_action :set_publish, only: [:show, :edit, :update, :destroy]

  # GET /publishes
  # GET /publishes.json
  def index
    @publishes = Publish.all
  end

  # GET /publishes/1
  # GET /publishes/1.json
  def show
  end

  # GET /publishes/new
  def new
    @publish = Publish.new
  end

  # GET /publishes/1/edit
  def edit
  end

  helper_method :like
  def like
    #current_item = @publish.detect{|r| r.id == params[:id].to_i}
    #@upVote = current_item.votes.find_by_user_id(current_user.id)
    #unless @upVote
      @upVote = Like.create(:islike => true, :drink_id => 0, :user_id => current_user.id)
      @upVote.user_id = current_user.id
    #end
    flash[:success] = @publish.Rname + " has been added to your likes"
    #@upVote.save
  end

  helper_method :dislike
  def dislike
  end

  # POST /publishes
  # POST /publishes.json
  def create
    @publish = Publish.new(publish_params)
    @publish.user_id = current_user.id
    if @publish.save
      redirect_to @publish
      flash[:success] = "Drink successfully created."
    else
      render 'new'
    end
=begin
    respond_to do |format|
      if @publish.save
        format.html { redirect_to @publish, notice: 'Publish was successfully created.' }
        format.json { render :show, status: :created, location: @publish }
      else
        format.html { render :new }
        format.json { render json: @publish.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  # PATCH/PUT /publishes/1
  # PATCH/PUT /publishes/1.json
  def update
    respond_to do |format|
      if @publish.update(publish_params)
        format.html { redirect_to @publish, notice: 'Drink published' }
        format.json { render :show, status: :ok, location: @publish }
      else
        format.html { render :edit }
        format.json { render json: @publish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publishes/1
  # DELETE /publishes/1.json
  def destroy
    @publish.destroy
    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Drink was successfully deleted' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publish
      @publish = Publish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publish_params
      params.require(:publish).permit(:Rname, :image, :ingredients, :instructions, :user_id, :drink_id, :remove_image)
    end
end
