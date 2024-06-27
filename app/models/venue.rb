class Venue < ApplicationRecord
  has_many :events

  def self.ransackable_associations(auth_object = nil)
    ["events"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["longitude", "latitude", "address", "city", "country", "created_at", "id", "id_value", "name", "state", "updated_at", "venue_id"]
  end

  validates :venue_id, :name, :address, :city, :country, presence: true
  validates :venue_id, uniqueness: true
end
