class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :update, :destroy]
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

    if @story.save
      render json: @story, status: :created
    else
      render json: @story.errors, status: :unprocessable_entity
    end
  end

  # PUT /users/:user_id/stories/:id
  def update
    if @story.update(story_params)
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

  def set_user
    current_user = Story.find(params[:user_id])

  end


  # Use callbacks to share common setup or constraints between actions.
  def set_story
    @story = Story.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def story_params
    params.require(:story).permit(:title, :style)
  end
end
