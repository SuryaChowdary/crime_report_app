class City < ApplicationRecord
  validates :name , presence: true
  has_many :localities
  has_many :crimes
end