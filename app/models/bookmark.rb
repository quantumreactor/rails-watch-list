class Bookmark < ApplicationRecord
  belongs_to :movie
  validates :movie, presence: true, uniqueness: { scope: :list }
  belongs_to :list
  validates :list, presence: true, uniqueness: true
  validates :comment, presence: true, length: { minimum: 6 }
end
