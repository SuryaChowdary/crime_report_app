class CrimeReporter < ApplicationRecord
  has_many :crimes, dependent: :destroy
  validates :name , presence: true, length: {minimum: 3 , maximum: 30}
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email , presence: true , 
                    uniqueness: {case_sensitive: false},
                    length: {maximum: 100},
                    format: {with: EMAIL_REGEX}
  validates :phone, presence: true, length: {minimum:10, maximum:12}
  validates :gender , presence: true
end