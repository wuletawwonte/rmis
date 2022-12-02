class Proposal < ApplicationRecord
  after_create :add_pi
  mount_uploader :attachement, AttachementUploader
  belongs_to :user
  belongs_to :call, optional: true
  belongs_to :research_type
  belongs_to :theme

  enum :status, { initialized: 0, submited: 1, accepted: 2 }

  validates :attachement, :title, :budget, presence: true

  has_many :members
  has_many :users, through: :members

  private

  def add_pi
    members.create(user:, proposal: self, role: Member.roles[:principal_investigator],
                   status: Member.statuses[:joined])
  end
end
