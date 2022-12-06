# == Schema Information
#
# Table name: members
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  proposal_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  role        :integer          default("co_investigator")
#  status      :integer          default("joined")
#
class Member < ApplicationRecord
  belongs_to :user
  belongs_to :proposal

  enum :role, { co_investigator: 0, principal_investigator: 1 }
  enum :status, { joined: 0, envited: 1 }

  scope :researcher_ids, ->(proposal_id) { where(proposal_id:).pluck(:user_id) }
  scope :envitations, ->(user) { where(user_id: user.id).includes(:proposal).envited }
end
