class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :prompt_attempts_today
      t.date :last_prompt_attempt_date

      t.timestamps
    end
  end
end
