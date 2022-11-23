class ResearchType < ApplicationRecord
  has_many :proposals

  enum :gender, { male: 0, female: 1, male_and_female: 2 }
  enum :fund_source, { internal: 0, external: 1 }

  validates :name, presence: true
  validates :max_duration, comparison: { greater_than: 0, less_than_or_equal_to: 5 }
end
