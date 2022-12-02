class Document < ApplicationRecord
  mount_uploader :attachement, DocumentUploader
  belongs_to :user

  validates :title, :attachement, presence: true
end
