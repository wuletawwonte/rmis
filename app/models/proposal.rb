# == Schema Information
#
# Table name: proposals
#
#  id               :bigint           not null, primary key
#  abstract         :text
#  attachement      :string
#  budget           :integer
#  code             :string
#  status           :integer          default("initialized")
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  call_id          :bigint
#  research_type_id :bigint           not null
#  theme_id         :bigint           not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_proposals_on_call_id           (call_id)
#  index_proposals_on_code              (code) UNIQUE
#  index_proposals_on_research_type_id  (research_type_id)
#  index_proposals_on_theme_id          (theme_id)
#  index_proposals_on_user_id           (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (call_id => calls.id)
#  fk_rails_...  (research_type_id => research_types.id)
#  fk_rails_...  (theme_id => themes.id)
#  fk_rails_...  (user_id => users.id)
#
class Proposal < ApplicationRecord
  after_create :add_pi, :add_code
  mount_uploader :attachement, AttachementUploader
  belongs_to :user
  belongs_to :call, optional: true
  belongs_to :research_type
  belongs_to :theme

  enum :status, { initialized: 0, submitted: 1, accepted: 2 }

  validates :attachement, :title, :budget, presence: true

  has_many :members, dependent: :destroy
  has_many :users, through: :members

  scope :joined, ->(user) { joins(:members).where("members.user_id = ?", user.id).where("members.status = ?", Member.statuses[:joined]) }


  private

  def add_pi
    members.create(user: self.user, proposal: self, role: Member.roles[:principal_investigator],
                   status: Member.statuses[:joined])
  end

  def add_code
    self.code = "RMIS-#{self.id}/#{Date.current.year}"
  end
end
