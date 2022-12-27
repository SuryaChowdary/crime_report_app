class Locality < ApplicationRecord
  validates :street, presence: true
  belongs_to :city
  has_many :crimes
end