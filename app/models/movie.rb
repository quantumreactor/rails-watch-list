class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true, uniqueness: { case_sensitive: false }
  has_many :bookmarks
  has_many :lists, through: :bookmarks
end
