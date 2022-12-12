# == Schema Information
#
# Table name: subscribers
#
#  id                :bigint           not null, primary key
#  active            :boolean          default(FALSE)
#  email             :string
#  subscription_hash :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_subscribers_on_email  (email) UNIQUE
#
class Subscriber < ApplicationRecord
  before_create :add_subscription_hash

  validates :email, uniqueness: { case_sensitive: false }

  private

  def add_subscription_hash
    self.subscription_hash = SecureRandom.hex(5)
  end
end
