class Proposal < ApplicationRecord
  mount_uploader :attachement, AttachementUploader
  belongs_to :user
  belongs_to :theme

  validates :attachement, :title, presence: true

  has_many :members
  has_many :users, through: :members
end
