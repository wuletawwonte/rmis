# == Schema Information
#
# Table name: academic_ranks
#
#  id         :bigint           not null, primary key
#  name       :string
#  order_key  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_academic_ranks_on_name  (name) UNIQUE
#
class AcademicRank < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
