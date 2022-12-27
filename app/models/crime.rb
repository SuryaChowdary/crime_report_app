class Crime < ApplicationRecord
  validates :crime_description, presence: true, length: {minimum:5, maximum: 500}
  validates :crime_time, presence: true
  validates :priority, presence: true
  validates :resolved, presence: true 
  belongs_to :crime_reporter , optional: true
  belongs_to :city
  belongs_to :locality
end