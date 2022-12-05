# == Schema Information
#
# Table name: research_types
#
#  id                 :bigint           not null, primary key
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  call_based         :boolean
#  max_budget         :integer
#  gender             :integer          default("male_and_female")
#  fund_source        :integer          default("internal")
#  min_researcher     :integer
#  max_duration       :integer
#  possible_extension :integer
#
class ResearchType < ApplicationRecord
  has_many :proposals

  enum :gender, { male: 0, female: 1, male_and_female: 2 }
  enum :fund_source, { internal: 0, external: 1 }

  validates :name, presence: true
  validates :min_researcher, comparison: { greater_than: 0, less_than_or_equal_to: 20 }
  validates :max_duration, comparison: { greater_than: 0, less_than_or_equal_to: 10 }
end
