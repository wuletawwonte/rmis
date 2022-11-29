class Member < ApplicationRecord
  belongs_to :user
  belongs_to :proposal

  enum :role, { coinvestigator: 0, principal_investigator: 1 }
  enum :status, { joined: 0, envited: 1 }

end

