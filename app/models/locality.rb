class Locality < ApplicationRecord
  validates :name, presence: true
  belongs_to :city
  has_many :crimes
end