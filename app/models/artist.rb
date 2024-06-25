class Artist < ApplicationRecord
  has_and_belongs_to_many :events

  validates :artist_id, :name, :url, presence: true
  validates :artist_id, uniqueness: true
end
