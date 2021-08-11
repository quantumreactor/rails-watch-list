class List < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
end
