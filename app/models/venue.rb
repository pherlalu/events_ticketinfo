class Venue < ApplicationRecord
  has_many :events

  validates :venue_id, :name, :address, :city, :country, presence: true
  validates :venue_id, uniqueness: true
end
