# == Schema Information
#
# Table name: faculties
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_faculties_on_name  (name) UNIQUE
#
class Faculty < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
