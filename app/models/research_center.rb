# frozen_string_literal: true

# == Schema Information
#
# Table name: research_centers
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ResearchCenter < ApplicationRecord
  has_one :user, dependent: :destroy
  accepts_nested_attributes_for :user

  validates :name, presence: true
end
