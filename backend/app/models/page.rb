class Page < ApplicationRecord
  belongs_to :story

  validates :page_text, presence: true
end
