# == Schema Information
#
# Table name: documents
#
#  id          :bigint           not null, primary key
#  attachement :string
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_documents_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Document < ApplicationRecord
  mount_uploader :attachement, DocumentUploader
  belongs_to :user

  validates :title, :attachement, presence: true
end
