class Member < ApplicationRecord
  belongs_to :user
  belongs_to :proposal

  enum :role, { co_investigator: 0, principal_investigator: 1 }
  enum :status, { joined: 0, envited: 1 }

  scope :researcher_ids, ->(proposal_id) { where(proposal_id: proposal_id).pluck(:user_id) } 

end

