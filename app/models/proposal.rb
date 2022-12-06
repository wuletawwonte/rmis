# == Schema Information
#
# Table name: proposals
#
#  id               :bigint           not null, primary key
#  user_id          :bigint           not null
#  title            :string
#  attachement      :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  abstract         :text
#  research_type_id :bigint           not null
#  call_id          :bigint
#  status           :integer          default("initialized")
#  budget           :integer
#  theme_id         :bigint           not null
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
