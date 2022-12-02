class AcademicRank < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
