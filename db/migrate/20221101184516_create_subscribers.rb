# frozen_string_literal: true

class CreateSubscribers < ActiveRecord::Migration[7.0]
  def change
    create_table :subscribers do |t|
      t.string :email, index: {unique: true}
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
