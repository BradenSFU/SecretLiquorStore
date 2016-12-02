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
    15.times { @publish.ingredients.build }
  end

  # GET /publishes/1/edit
  def edit
    @publish = Publish.find(params[:id])
    if @publish.user_id != current_user.id
      redirect_to current_user
    end
    remaining_blank_inputs = 15 - @publish.ingredients.size
    remaining_blank_inputs.times { @publish.ingredients.build }
  end

  def destroy_invalid_inputs
    @publish.ingredients.each do |i|
      i.destroy unless i.name=~/[A-Za-z]/
    end
  end

  def add_like
    create_vote(true)
  end

  def add_dislike
    create_vote(false)
  end

  def delete_vote
    @publish = Publish.find(params[:id])
    @publish.likes.where(:publish_id => @publish.id, :user_id => current_user.id).destroy_all
    respond_to do |format|
      format.html { redirect_to publish_path(@publish) }
      format.xml  { head :ok }
    end
  end

  def create_vote(vote)
    @publish = Publish.find(params[:id])
    new_vote = Like.new
    new_vote.islike = vote
    current_user.likes << new_vote
    @publish.likes << new_vote
    new_vote.save
    redirect_to(@publish)
  end

  # POST /publishes
  # POST /publishes.json
  def create
    @publish = Publish.new(publish_params)
    @publish.user_id = current_user.id
    destroy_invalid_inputs
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
        destroy_invalid_inputs
        format.html { redirect_to @publish, notice: 'Drink updated' }
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
      params.require(:publish).permit(:name, :image, :instructions, :user_id, :drink_id, :remove_image, ingredients_attributes: [:id, :name])
    end
end
