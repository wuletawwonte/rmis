class Subscriber < ApplicationRecord
  before_create :add_subscription_hash

  private
    def add_subscription_hash
      self.subscription_hash = SecureRandom.hex
    end
end
