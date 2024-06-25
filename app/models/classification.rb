class Classification < ApplicationRecord
  has_many :events

  validates :classification_id, :segment, :genre, presence: true
  validates :classification_id, uniqueness: true
end
