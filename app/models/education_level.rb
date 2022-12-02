class EducationLevel < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
