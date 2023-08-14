# frozen_string_literal: true

# == Schema Information
#
# Table name: members
#
#  id          :bigint           not null, primary key
#  role        :integer          default("co_investigator")
#  status      :integer          default("joined")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  proposal_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_members_on_proposal_id  (proposal_id)
#  index_members_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (proposal_id => proposals.id)
#  fk_rails_...  (user_id => users.id)
#
class Member < ApplicationRecord
  belongs_to :user
  belongs_to :proposal

  enum :role, { co_investigator: 0, principal_investigator: 1 }
  enum :status, { joined: 0, envited: 1 }

  scope :member_ids_of, ->(proposal) { where(proposal_id: proposal.id).pluck(:user_id) }
  scope :envitations, ->(user) { where(user_id: user.id).includes(:proposal).envited }
end
