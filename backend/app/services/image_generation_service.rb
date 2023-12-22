class ImageGenerationService
  def self.generate_image_url (image_prompt, current_user)
     begin
      connection = Faraday.new('https://api.openai.com/v1/images/generations') do |conn|
        conn.request :json
        conn.headers['Authorization'] = "Bearer #{Rails.application.credentials.openai[:api_key]}"
        conn.adapter Faraday.default_adapter
      end

        body = {
        prompt: image_prompt,
        model: "dall-e-3",
        n: 1,
        size: '1024x1024',
        response_format: 'url'
      }
      response = connection.post do |req|
        req.body = body
      end

      if response.success?
          current_user.update_attempts
           return JSON.parse(response.body)['data'][0]['url']
        # Reducing the number of remaining prompts if the image generation was a success.
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

  # Calculates the number of remaining prompt for the day the user has.
  def self.remaining_prompts(current_user)
    #This variable reprensents the number of prompts someone can try in a given day, as there is cost associated to each prompté
    max_attempts = 17
    max_attempts - current_user.prompt_attempts_today
  end


end
