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
      self.members.create(user: self.user, proposal: self, role: Member.role.principal_investigator, status: 0)
    end
end
