class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :members
  has_many :proposals, through: :members
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
end
