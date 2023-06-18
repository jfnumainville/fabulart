class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.references :story, null: false, foreign_key: true
      t.integer :page_number
      t.text :page_text
      t.text :image_prompt
      t.string :image_url

      t.timestamps
    end
  end
end
