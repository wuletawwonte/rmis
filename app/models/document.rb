# == Schema Information
#
# Table name: documents
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  user_id     :bigint           not null
#  attachement :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Document < ApplicationRecord
  mount_uploader :attachement, DocumentUploader
  belongs_to :user

  validates :title, :attachement, presence: true
end
