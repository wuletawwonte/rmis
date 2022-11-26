class Proposal < ApplicationRecord
  mount_uploader :attachement, AttachementUploader
  belongs_to :user
  belongs_to :call, optional: true
  belongs_to :research_type
  belongs_to :theme

  enum :status, { initialized: 0, submited: 1, accepted: 2 }

  validates :attachement, :title, :budget, presence: true

  has_many :members
  has_many :users, through: :members
end
