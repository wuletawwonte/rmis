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

  enum :sex, { Male: 0, Female: 1 }

  validates :first_name, :middle_name, :email, presence: true

  def initials
    "#{self.first_name.chr.upcase}#{self.middle_name.chr.upcase}"
  end
end
