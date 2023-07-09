class PagesController < ApplicationController
  #This is a constant of how many prompts a user can make in a given day.
  MAX_PROMPT_ATTEMPTS_PER_DAY = 50
 # TODO: Need to create the authenticate_user method for Auth0
  before_action :authenticate_user
  before_action :check_prompt_attempts, only: [:create, :update, :regenerate]
  before_action :set_story
  before_action :set_page, only: [:show, :update, :regenerate, :destroy]

  # GET /users/:user_id/stories/:story_id/pages
  def index
    @pages = @story.pages
    render json: @pages
  end

  # GET /users/:user_id/stories/:story_id/pages/:id
  def show
    render json: @page
  end

  # POST /users/:user_id/stories/:story_id/pages
  def create
    @page = @story.pages.new(page_params)
    @page.image_url = generate_image_url if @page.image_prompt

    if @page.save
      @current_user.update_attempts
       render json: { page: @page, remaining_prompts: remaining_prompts}, status: :created
    else
      render json: @page.errors, status: :unprocessable_entity
    end
  end

  # PUT /users/:user_id/stories/:story_id/pages/:id
  def update
    @page.assign_attributes(page_params)

    if @page.image_prompt_changed? # check if the image_prompt attribute has changed
      @current_user.update_attempts if !@page.image_url.nil? # The number of remaining prompt attempts for the day will not be reduced if the DALL-E API didn't work.
      @page.image_url = generate_image_url
    end

    if @page.save
     render json: { page: @page, remaining_prompts: remaining_prompts}

    else
      render json: @page.errors, status: :unprocessable_entity
    end
  end

  # POST /users/:user_id/stories/:story_id/pages/:id/regenerate
  def regenerate
    @page.image_url = generate_image_url
    @current_user.update_attempts if !@page.image_url.nil?

      if @page.save
        render json: { page: @page, remaining_prompts: remaining_prompts}

      else
        render json: @page.errors, status: :unprocessable_entity
      end
  end



  # DELETE /users/:user_id/stories/:story_id/pages/:id
  def destroy
    @page.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def authenticate_user
    @current_user = User.find(params[:user_id])
  end

  # This method returns a status forbidden in case that the user reached the maximum number of prompts allowed for the day.
  def check_prompt_attempts
    if @current_user.prompt_attempts_today >= MAX_PROMPT_ATTEMPTS_PER_DAY
      render json: { error: 'You have reached the maximum number of prompt attempts for today.' }, status: :forbidden
    end
  end

  def set_story
    @story = @current_user.stories.find(params[:story_id])
  end

  def set_page
    @page = @story.pages.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def page_params
    params.require(:page).permit(:image_prompt, :image_url, :page_number, :page_text)
  end

  # Calculates the number of remaining prompt for the dat the user has.
  def remaining_prompts

    MAX_PROMPT_ATTEMPTS_PER_DAY - @current_user.prompt_attempts_today

  end


  #This method calls the DALL-E API and sets the image_url value to the url contained the response.
  def generate_image_url
    begin
      connection = Faraday.new('https://api.openai.com/v1/images/generations') do |conn|
        conn.request :json
        conn.headers['Authorization'] = "Bearer #{Rails.application.credentials.openai[:api_key]}"
        conn.adapter Faraday.default_adapter
      end

      body = {
        prompt: @page.image_prompt,
        n: 1,
        size: '1024x1024',
        response_format: 'url'
      }
      response = connection.post do |req|
        req.body = body
      end

      if response.success?
        return JSON.parse(response.body)['data'][0]['url']
      else
        # Log the unsuccessful response details
        # TODO: Need to have front-end tell user to try again when the image_url value is null.
        # TODO: Need to setup the log rotation in PROD.
        Rails.logger.error("DALL-E API Unsuccessful Response: #{response.body}")
        return nil
      end
    rescue Faraday::Error => e
      # Log the Faraday error details
      Rails.logger.error("Faraday Error: #{e.message}")
      return nil
    end
  end


end
