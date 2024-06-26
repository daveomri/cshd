class Review < ApplicationRecord
  enum interaction_id: {
    "Listen later": 0,
    "Like": 1,
    "Dislike": 2
  }

  enum rating: {
    "*": 1,
    "**": 2,
    "***": 3,
    "****": 4,
    "*****": 5
  }
end
