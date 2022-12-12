# == Schema Information
#
# Table name: research_types
#
#  id                 :bigint           not null, primary key
#  call_based         :boolean
#  fund_source        :integer          default("internal")
#  gender             :integer          default("male_and_female")
#  max_budget         :integer
#  max_duration       :integer
#  min_researcher     :integer
#  name               :string
#  possible_extension :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_research_types_on_name  (name) UNIQUE
#
class ResearchType < ApplicationRecord
  has_many :proposals

  enum :gender, { male: 0, female: 1, male_and_female: 2 }
  enum :fund_source, { internal: 0, external: 1 }

  validates :name, presence: true
  validates :min_researcher, comparison: { greater_than: 0, less_than_or_equal_to: 20 }
  validates :max_duration, comparison: { greater_than: 0, less_than_or_equal_to: 10 }
end
