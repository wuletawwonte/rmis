class Proposal < ApplicationRecord
  mount_uploader :attachement, AttachementUploader
  belongs_to :user

  validates :title, presence: true


  has_many :members
  has_many :users, through: :members
end
