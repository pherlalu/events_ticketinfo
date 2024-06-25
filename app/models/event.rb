class Event < ApplicationRecord
  belongs_to :venue
  belongs_to :classification
  has_and_belongs_to_many :artists

  validates :event_id, :name, :url, presence: true
  validates :event_id, uniqueness: true
end
