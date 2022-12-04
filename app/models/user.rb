# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  middle_name            :string
#  last_name              :string
#  sex                    :integer          default("Male")
#  role                   :string           default("researcher")
#  profile_id             :bigint
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :members, dependent: :destroy
  has_many :proposals, through: :members, dependent: :destroy
  has_many :proposals, dependent: :destroy
  has_many :research_centers
  has_many :themes
  has_many :calls
  belongs_to :profile, optional: true

  enum :sex, { Male: 0, Female: 1 }

  validates :first_name, :middle_name, :email, presence: true

  def initials
    "#{first_name.chr.upcase}#{middle_name.chr.upcase}"
  end

  def full_name
    "#{first_name} #{middle_name}"
  end

  def admin?
    role == 'admin'
  end
end
