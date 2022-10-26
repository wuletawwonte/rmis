class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :members
  has_many :proposals, through: :members
  has_many :research_centers
  has_many :themes

  validates :first_name, :middle_name, :email, presence: true
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@amu\.edu\.com\z/ , message: "Only AMU institutional email allowed" }
end
