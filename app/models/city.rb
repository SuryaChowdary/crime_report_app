class City < ApplicationRecord
  validates :name , presence: true
  has_many :localities, dependent: :destroy
  has_many :crimes, dependent: :destroy
end