# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  color                  :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  middle_name            :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :string           default("researcher")
#  sex                    :integer          default("Male")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  profile_id             :bigint
#  research_center_id     :bigint
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_profile_id            (profile_id)
#  index_users_on_research_center_id    (research_center_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (profile_id => profiles.id)
#  fk_rails_...  (research_center_id => research_centers.id)
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_create :add_color
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :members, dependent: :destroy
  has_many :proposals, through: :members, dependent: :destroy
  has_many :proposals, dependent: :destroy
  has_many :themes
  has_many :calls
  has_one_attached :avatar
  belongs_to :profile, optional: true
  belongs_to :research_center, optional: true, autosave: true

  enum :sex, { Male: 0, Female: 1 }

  validates :first_name, :middle_name, :email, presence: true

  scope :researchers_only, -> { where(role: 'researcher') }
  scope :members_of, ->(proposal) { researchers_only.joins(:members).where(members: { proposal_id: proposal.id }) }
  scope :not_members_of, ->(proposal) { researchers_only.where.not(id: Member.member_ids_of(proposal)) }
  scope :search_by_name, lambda { |search_key|
                           where('first_name LIKE :search OR middle_name LIKE :search OR last_name LIKE :search', search: "%#{search_key}%")
                         }

  def initials
    "#{first_name.chr.upcase}#{middle_name.chr.upcase}"
  end

  def full_name
    "#{first_name} #{middle_name}"
  end

  def admin?
    role == 'admin'
  end

  def researcher?
    role == 'researcher'
  end

  def coordinator?
    role == 'research_coordinator'
  end

  private

  def add_color
    self.color = %w[orange lime green teal cyan sky violet fuchsia pink].sample
  end
end
