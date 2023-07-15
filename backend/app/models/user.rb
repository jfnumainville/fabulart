class User < ApplicationRecord
  has_many :stories, dependent: :destroy


    # This method if for limitting the number of times a user generates an image to a certain number every day.
    # If there were no prompts today, we will set the last_prompt_attempt_date to today and reset the prompt counter to 1
    # However, if they were already prompt_attempts today, then we increment the prompt counter by 1 .

   def update_attempts
    today = Date.today

    if self.last_prompt_attempt_date < today
      self.last_prompt_attempt_date = today
      self.prompt_attempts_today = 1
    else
      self.prompt_attempts_today += 1
    end

    self.save # Remember to persist the changes to the database
  end



end
