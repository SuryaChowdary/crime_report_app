class CityLocality < ApplicationRecord
  belongs_to :city
  belongs_to :locality
end