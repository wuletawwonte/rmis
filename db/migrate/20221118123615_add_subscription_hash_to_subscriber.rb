# frozen_string_literal: true

class AddSubscriptionHashToSubscriber < ActiveRecord::Migration[7.0]
  def change
    add_column :subscribers, :subscription_hash, :string
  end
end
