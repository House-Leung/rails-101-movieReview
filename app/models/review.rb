class Review < ApplicationRecord
  belongs_to :user
  brlongs_to :movie
end
