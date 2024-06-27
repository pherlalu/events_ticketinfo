class Event < ApplicationRecord

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "date_time", "event_id", "id", "id_value", "image_url", "info", "max_price", "min_price", "name", "updated_at", "url", "venue_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["artists", "classifications", "venue"]
  end

  belongs_to :venue
  has_and_belongs_to_many :classifications
  has_and_belongs_to_many :artists

  validates :event_id, :name, :url, presence: true
  validates :event_id, uniqueness: true
end
