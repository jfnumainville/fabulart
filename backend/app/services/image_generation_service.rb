class ImageGenerationService

  def self.generate_image_url (image_prompt)
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
