class Crime < ApplicationRecord
  validates :name, presence: true, length: {minimum:3 }
  validates :crime_description, presence: true, length: {minimum:5, maximum: 500}
  validates :crime_time, presence: true
  validates :priority, presence: true
  validates :resolved, presence: true
end