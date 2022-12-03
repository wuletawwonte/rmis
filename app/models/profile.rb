class Profile < ApplicationRecord
  belongs_to :academic_rank
  belongs_to :faculty
end
