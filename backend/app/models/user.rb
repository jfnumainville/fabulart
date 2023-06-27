class User < ApplicationRecord
  has_many stories, dependent: destroy
end
