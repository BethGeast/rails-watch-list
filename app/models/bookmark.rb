class Bookmark < ApplicationRecord
  # Associations
  belongs_to :movie
  belongs_to :list

  # Validations
  validates :movie, uniqueness: { scope: :list }
  validates :comment, length: { minimum: 6 }
end
