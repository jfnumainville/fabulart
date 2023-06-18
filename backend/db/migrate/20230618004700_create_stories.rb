class CreateStories < ActiveRecord::Migration[6.1]
  def change
    create_table :stories do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :style

      t.timestamps
    end
  end
end
