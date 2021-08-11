class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true, uniqueness: { case_sensitive: false }
  has_many :bookmarks
  has_many :lists, through: :bookmarks
  #accepts_nested_attributes_for :lists, reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true
end
