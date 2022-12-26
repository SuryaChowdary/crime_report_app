class Locality < ApplicationRecord
  validates :street, presence: true
  belongs_to :city
end