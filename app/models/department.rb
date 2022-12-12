# == Schema Information
#
# Table name: departments
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_departments_on_name  (name) UNIQUE
#
class Department < ApplicationRecord
  validates :name, presence: true
end
