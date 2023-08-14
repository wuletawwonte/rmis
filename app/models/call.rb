# frozen_string_literal: true

# == Schema Information
#
# Table name: calls
#
#  id         :bigint           not null, primary key
#  code       :string
#  deadline   :date
#  published  :boolean
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_calls_on_code     (code) UNIQUE
#  index_calls_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Call < ApplicationRecord
  before_create :add_code
  belongs_to :user
  has_rich_text :content
  has_many :proposals

  validates :title, :deadline, presence: true

  private

  def add_code
    self.code = "#{SecureRandom.hex(4)}-#{DateTime.now.year}"
  end
end
