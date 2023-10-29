class AddImageFieldsToStories < ActiveRecord::Migration[6.1]  # Your Rails version might differ
  def change
    add_column :stories, :image_prompt, :text
    add_column :stories, :image_url, :string
  end
end
