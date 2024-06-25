class Classification < ApplicationRecord
  has_and_belongs_to_many :events

  validates :classification_id, :segment, :genre, presence: true
end
