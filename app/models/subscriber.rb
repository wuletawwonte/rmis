# == Schema Information
#
# Table name: subscribers
#
#  id                :bigint           not null, primary key
#  email             :string
#  active            :boolean          default(FALSE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  subscription_hash :string
#
class Subscriber < ApplicationRecord
  before_create :add_subscription_hash

  validates :email, uniqueness: { case_sensitive: false }

  private

  def add_subscription_hash
    self.subscription_hash = SecureRandom.hex(5)
  end
end
