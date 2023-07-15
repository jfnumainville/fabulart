class Page < ApplicationRecord
  belongs_to :story
  validates :page_text, presence: { message: "The page text is required" }
  validates :page_number, uniqueness: { scope: :story_id, message: "A page with this number already exists in the same story" }
  end
