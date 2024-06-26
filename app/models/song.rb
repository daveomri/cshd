class Song < ApplicationRecord
  enum language_id: {
    "cz": 0,
    "sk": 1,
    "en": 2
  }
end
