class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :update, :destroy]
  before_action :authenticate_user
 # TODO: Need to create the authenticate_user method for Auth0
 # before_action :authenticate_request!

  # GET /users/:user_id/stories
  def index
    @user = User.find(params[:user_id])
    @stories = @user.stories
    render json: @stories
  end

  # POST /users/:user_id/stories
  def create
    @user = User.find(params[:user_id])
    @story = @user.stories.new(story_params)
    @story.image_url = ImageGenerationService.generate_image_url(@story.image_prompt)
    @current_user.update_attempts if !@story.image_url.nil?

    if @story.save
      render json: @story, status: :created
    else
      render json: @story.errors, status: :unprocessable_entity
    end
  end

  # PUT /users/:user_id/stories/:id
  def update
      @story.assign_attributes(story_params)

    if @story.image_prompt_changed?
      @story.image_url = ImageGenerationService.generate_image_url(@story.image_prompt)
      @current_user.update_attempts if !@story.image_url.nil?
    end


    if @story.save
      render json: @story
    else
      render json: @story.errors, status: :unprocessable_entity
    end
  end

  # GET /users/:user_id/stories/:id
  def show
    render json: @story
  end

  # DELETE /users/:user_id/stories/:id
  def destroy
    @story.destroy
  end

  private

  def authenticate_user
    @current_user = User.find(params[:user_id])
    p "The current_user is " + @current_user.to_s
    end


  # Use callbacks to share common setup or constraints between actions.
  def set_story
    @story = Story.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def story_params
    params.require(:story).permit(:title, :style, :image_prompt)
  end
end
