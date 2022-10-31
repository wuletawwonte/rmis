class ResearchType < ApplicationRecord
  has_many :proposals

  validates :name, presence: true
  validates :allowed_per_year, comparison: { greater_than: 0, less_than_or_equal_to: 5 }, presence: true
end
