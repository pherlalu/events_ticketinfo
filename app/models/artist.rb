class Artist < ApplicationRecord
  has_and_belongs_to_many :events
  
  def self.ransackable_associations(auth_object = nil)
    ["events"]
  end

  def self.ransackable_attributes(auth_object = nil)
    super + ['image_blob_id']
  end

  has_one_attached :image
  
  validates :artist_id, :name, :url, presence: true
  validates :artist_id, uniqueness: true
end
