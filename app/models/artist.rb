class Artist < ApplicationRecord
  enum state_id: {
    "Czech Republic": 0,
    "Slovakia": 1,
    "Great Britain": 2,
    "USA": 3
  }
end
